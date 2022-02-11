module ContaHelper
    def datacao(datetime)
        datetime.strftime('%H:%M:%S, %e / %B / %Y')
    end
end
