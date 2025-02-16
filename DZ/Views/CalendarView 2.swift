import SwiftUI

struct CalendarView: View {
    @State private var selectedDate: Date? = nil // Для интерактивности в будущем

    var body: some View {
        VStack {
            // Заголовок
            HStack {
                Button(action: {
                    // Действие для кнопки "Назад"
                }) {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.blue)
                        .padding(.leading, 16)
                }
                Spacer()
                Text("August 2024")
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
                Button(action: {
                    // Действие для переключения месяца
                }) {
                    Image(systemName: "arrow.right")
                        .foregroundColor(.blue)
                        .padding(.trailing, 16)
                }
            }
            .padding(.top, 20)

            // Календарная сетка
            CalendarGridView()

            // Легенда
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 20, height: 10)
                    Text("Группа (1.08 - 14.08)")
                }
                HStack {
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 20, height: 10)
                    Text("Группа (11.08 - 24.08)")
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 10)

            // Кнопка добавления
            Spacer()
            Button(action: {
                // Действие для добавления отпуска
            }) {
                Text("+ Добавить новый отпуск")
                    .foregroundColor(.blue)
                    .padding(.bottom, 20)
            }
        }
        .navigationBarHidden(false)
    }
}

// Компонент для календарной сетки
struct CalendarGridView: View {
    var body: some View {
        VStack(spacing: 10) {
            // Дни недели
            HStack {
                ForEach(["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"], id: \.self) { day in
                    Text(day)
                        .font(.caption)
                        .frame(maxWidth: .infinity)
                }
            }
            .padding(.horizontal, 16)

            // Примерные строки дней (можно доработать)
            ForEach(0..<5) { _ in
                HStack(spacing: 10) {
                    ForEach(0..<7) { _ in
                        Text("10") // Пример дня
                            .frame(maxWidth: .infinity)
                            .padding(8)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(8)
                    }
                }
                .padding(.horizontal, 16)
            }
        }
    }
}
