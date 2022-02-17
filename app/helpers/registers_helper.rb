module RegistersHelper
    def datacao(datetime)
        datetime.strftime('%e / %m / %Y')
    end
    def dataday(datetime)
        datetime.strftime('%A')
    end
    def datahour(datetime)
        datetime.strftime('%-H')
    end
end
