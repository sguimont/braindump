package com.mushcorp.lt.xmpp

import org.jivesoftware.smack.packet.Presence
import com.mushcorp.lt.artefact.Note
import com.mushcorp.lt.artefact.Book
import com.mushcorp.lt.artefact.Link
import com.mushcorp.lt.artefact.Todo
import java.text.SimpleDateFormat

/**
 sendXmppMessage( jabberId,  message )

 changeXmppRosterStatus( newStatus, presence )

 addXmppContact( jabberId )
 removeXmppContact( jabberId )
 getAllXmppContacts()
 */
class DefaultXmppBotService {
    boolean transactional = true

    static expose = ['xmpp']

    def sendNotification(to, msg) {
        sendXmppMessage(to, msg)
    }

    def helpXmppCommand(msg) {
        onXmppMessage(msg)
    }

    def noteXmppCommand(msg) {
        Note note = new Note()
        note.notes = msg.body.substring(6).trim()
        if (note.save(flush: true)) {
            sendXmppMessage(msg.from, "Note added : " + note.id)
        }
        else {
            sendXmppMessage(msg.from, "Cannot add note : " + note.errors)
        }
    }

    def linkXmppCommand(msg) {
        Link link = new Link()
        def arguments = msg.body.substring(6).trim().split("!")
        println arguments
        link.url = arguments[0].trim()
        link.title = arguments[1].trim()
        if (arguments[2]) {
            link.notes = arguments[2].trim()
        }
        if (link.save(flush: true)) {
            sendXmppMessage(msg.from, "Link added : " + link.id)
        }
        else {
            sendXmppMessage(msg.from, "Cannot add link : " + link.errors)
        }
    }

    def bookXmppCommand(msg) {
        Book book = new Book()
        def arguments = msg.body.substring(6).trim().split("!")
        println arguments
        book.bookUrl = arguments[0].trim()
        book.title = arguments[1].trim()
        if (arguments[2]) {
            book.notes = arguments[2].trim()
        }
        if (book.save(flush: true)) {
            sendXmppMessage(msg.from, "Book added : " + book.id)
        }
        else {
            sendXmppMessage(msg.from, "Cannot add book : " + book.errors)
        }
    }

    def todoXmppCommand(msg) {
        Todo todo = new Todo()
        def arguments = msg.body.substring(6).trim().split("!")
        println arguments
        todo.to = msg.from
        todo.todo = arguments[0].trim()
        if (arguments[1]) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm")
            todo.reminder = sdf.parse(arguments[1].trim())
        }
        if (todo.save(flush: true)) {
            sendXmppMessage(msg.from, "Todo added : " + todo.id)
        }
        else {
            sendXmppMessage(msg.from, "Cannot add todo : " + todo.errors)
        }
    }

    def doneTodoXmppCommand(msg) {
        Todo todo = Todo.get(msg.body.substring(10).trim())
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm")
        todo.reminder = sdf.parse("2012-01-01 01:01")
        if (todo.save(flush: true)) {
            sendXmppMessage(msg.from, "Todo doned : " + todo.id)
        }
        else {
            sendXmppMessage(msg.from, "Cannot done this todo : " + todo.errors)
        }
    }

    def listNotesXmppCommand(msg) {
        def notes = Note.collection.find()
        sendXmppMessage(msg.from, "Notes: \n" + notes.collect { "    " + it.notes }.join("\n"))
    }

    def listLinksXmppCommand(msg) {
        def links = Link.collection.find()
        sendXmppMessage(msg.from, "Links: \n" + links.collect { "    " + it.title + " : " + it.url }.join("\n"))
    }

    def listBooksXmppCommand(msg) {
        def books = Book.collection.find()
        sendXmppMessage(msg.from, "Books: \n" + books.collect { "    " + it.title + " : " + it.bookUrl }.join("\n"))
    }

    def listTodosXmppCommand(msg) {
        def todos = Todo.collection.find()
        sendXmppMessage(msg.from, "Todos: \n" + todos.collect { "    (" + it._id + ") " + it.todo + " : " + it.to + " : " + it.reminder }.join("\n"))
    }

    def changeStatusXmppCommand(msg) {
        println msg.properties

        changeXmppRosterStatus(msg.body.substring(14).trim(), Presence.Type.available)
        sendXmppMessage(msg.from, "Check my new status '" + msg.body.substring(14).trim() + "'")
    }

    def listAllXmppCommand(msg) {
        def entries = getAllXmppContacts()
        sendXmppMessage(msg.from, entries)
    }

    def onXmppMessage(m) {
        def help = """Available commands are:
@help
@listAll
@changeStatus
@note/@link/@book/@todo
@doneTodo
@listNotes/@listLinks/@listBooks/@listTodos
"""
        sendXmppMessage(m.from, help)
    }
}
