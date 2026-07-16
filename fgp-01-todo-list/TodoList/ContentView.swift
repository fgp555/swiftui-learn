//
//  ContentView.swift
//  TodoList
//
//  Created by m1 on 17/07/2026.
//
import SwiftUI

struct ContentView: View {
    @State private var todos: [Todo] = [
        Todo(title: "Aprender SwiftUI"),
        Todo(title: "Hacer ejercicio"),
        Todo(title: "Leer un libro")
    ]

    @State private var showAddDialog = false
    @State private var newTodoText = ""

    var body: some View {
        NavigationStack {
            List {
                ForEach(todos) { todo in
                    TodoRow(
                        todo: todo,
                        onToggle: { toggleTodo(todo) }
                    )
                    .swipeActions(edge: .trailing) {
                        Button(role: .destructive) {
                            deleteTodo(todo)
                        } label: {
                            Label("Eliminar", systemImage: "trash")
                        }
                    }
                }
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
            }
            .listStyle(.plain)
            .navigationTitle("To Do")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showAddDialog = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .alert("Nueva tarea", isPresented: $showAddDialog) {
            TextField("Nueva tarea", text: $newTodoText)
            Button("Cancelar", role: .cancel) {
                newTodoText = ""
            }
            Button("Guardar") {
                addTodo()
            }
        }
    }

    private func addTodo() {
        let trimmed = newTodoText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        todos.append(Todo(title: trimmed))
        newTodoText = ""
    }

    private func deleteTodo(_ todo: Todo) {
        todos.removeAll { $0.id == todo.id }
    }

    private func toggleTodo(_ todo: Todo) {
        if let index = todos.firstIndex(where: { $0.id == todo.id }) {
            todos[index].completed.toggle()
        }
    }
}

struct TodoRow: View {
    let todo: Todo
    let onToggle: () -> Void

    var body: some View {
        HStack {
            Button(action: onToggle) {
                Image(systemName: todo.completed ? "checkmark.circle.fill" : "circle")
                    .foregroundStyle(todo.completed ? Color.accentColor : Color.secondary)
                    .font(.title3)
            }
            .buttonStyle(.plain)

            Text(todo.title)
                .font(.body)
                .strikethrough(todo.completed)
                .foregroundStyle(todo.completed ? .secondary : .primary)

            Spacer()
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.secondarySystemBackground))
        )
    }
}

#Preview {
    ContentView()
}
