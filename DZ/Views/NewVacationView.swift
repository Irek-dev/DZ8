import SwiftUI

struct NewVacationView: View {
    @State private var startDate: Date = Date() // Начальная дата
    @State private var endDate: Date = Date() // Конечная дата
    @State private var selectedEmployees: [String] = [] // Выбранные сотрудники (заглушка)
    @State private var selectedColor: Color = .blue // Цвет группы

    var body: some View {
        VStack(spacing: 20) {
            Text("Новый отпуск")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.top, 20)

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Выбор дат
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Настроить дату:")
                            .font(.headline)
                        DatePicker("Начало:", selection: $startDate, displayedComponents: .date)
                            .datePickerStyle(.compact)
                        DatePicker("Конец:", selection: $endDate, displayedComponents: .date)
                            .datePickerStyle(.compact)
                    }

                    // Выбор сотрудников
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Выбрать сотрудников:")
                            .font(.headline)
                        Button(action: {
                            print("Открыть выбор сотрудников")
                        }) {
                            HStack {
                                Text(selectedEmployees.isEmpty ? "Нажмите, чтобы выбрать" : selectedEmployees.joined(separator: ", "))
                                    .foregroundColor(selectedEmployees.isEmpty ? .gray : .primary)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(8)
                        }
                    }

                    // Выбор цвета
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Цвет группы:")
                            .font(.headline)
                        ColorPicker("Выберите цвет", selection: $selectedColor)
                            .padding(.horizontal, 10)
                    }
                }
                .padding(.horizontal, 16)
            }

            // Кнопка "Добавить"
            Button(action: {
                print("Добавить отпуск с датами \(startDate) - \(endDate)")
            }) {
                Text("Добавить")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal, 16)
            }
            .padding(.bottom, 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
}
