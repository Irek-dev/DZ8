import SwiftUI

struct MainMenuView: View {
    var body: some View {
        VStack(spacing: 40) {
            // Заголовок
            Text("HolidayMap")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 50)

            // Кнопки
            VStack(spacing: 20) {
                NavigationLink(destination: CalendarView()) {
                    Text("Календарь")
                        .font(.title2)
                        .foregroundColor(.blue)
                }
                NavigationLink(destination: NewEmployeeView()) {
                    Text("Новый сотрудник")
                        .font(.title2)
                        .foregroundColor(.blue)
                }
                NavigationLink(destination: NewVacationView()) {
                    Text("Настроить отпуска")
                        .font(.title2)
                        .foregroundColor(.blue)
                }
            }
            
            Spacer()
        }
        .navigationBarHidden(true)
    }
}
