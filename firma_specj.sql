-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 05 Gru 2022, 08:45
-- Wersja serwera: 10.4.21-MariaDB
-- Wersja PHP: 7.4.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `firma.specj`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kierownicy`
--

CREATE TABLE `kierownicy` (
  `ID_kierownika` int(11) NOT NULL,
  `Imie` varchar(255) DEFAULT NULL,
  `Nazwisko` varchar(255) DEFAULT NULL,
  `ID_pracownika` int(11) DEFAULT NULL,
  `ID_stawki` int(11) DEFAULT NULL,
  `ID_miejsc_pracy` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `miejsce_pracy`
--

CREATE TABLE `miejsce_pracy` (
  `ID_miejsca_pracy` int(11) NOT NULL,
  `Nazwa_miejsca_pracy` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `miejsce_pracy`
--

INSERT INTO `miejsce_pracy` (`ID_miejsca_pracy`, `Nazwa_miejsca_pracy`) VALUES
(1, 'Magazyn'),
(2, 'Biuro');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownicy`
--

CREATE TABLE `pracownicy` (
  `ID_pracownika` int(11) NOT NULL,
  `Imie` varchar(255) DEFAULT NULL,
  `Nazwisko` varchar(255) DEFAULT NULL,
  `ID_kierownika` int(11) DEFAULT NULL,
  `ID_miejsca_pracy` int(11) DEFAULT NULL,
  `ID_stawki` int(11) DEFAULT NULL,
  `ID_stanowiska` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `stanowisko`
--

CREATE TABLE `stanowisko` (
  `ID_stanowiska` int(11) NOT NULL,
  `Nazwa_stanowiska` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `stanowisko`
--

INSERT INTO `stanowisko` (`ID_stanowiska`, `Nazwa_stanowiska`) VALUES
(1, 'Magazynier'),
(2, 'Inspektor');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `stawka`
--

CREATE TABLE `stawka` (
  `ID_stawki` int(11) NOT NULL,
  `Kwota` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `stawka`
--

INSERT INTO `stawka` (`ID_stawki`, `Kwota`) VALUES
(1, 4000),
(2, 2000);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `kierownicy`
--
ALTER TABLE `kierownicy`
  ADD PRIMARY KEY (`ID_kierownika`);

--
-- Indeksy dla tabeli `miejsce_pracy`
--
ALTER TABLE `miejsce_pracy`
  ADD PRIMARY KEY (`ID_miejsca_pracy`);

--
-- Indeksy dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  ADD PRIMARY KEY (`ID_pracownika`),
  ADD KEY `ID_kierownika` (`ID_kierownika`),
  ADD KEY `ID_miejsca_pracy` (`ID_miejsca_pracy`),
  ADD KEY `ID_stawki` (`ID_stawki`),
  ADD KEY `ID_stanowiska` (`ID_stanowiska`);

--
-- Indeksy dla tabeli `stanowisko`
--
ALTER TABLE `stanowisko`
  ADD PRIMARY KEY (`ID_stanowiska`);

--
-- Indeksy dla tabeli `stawka`
--
ALTER TABLE `stawka`
  ADD PRIMARY KEY (`ID_stawki`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `kierownicy`
--
ALTER TABLE `kierownicy`
  MODIFY `ID_kierownika` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `miejsce_pracy`
--
ALTER TABLE `miejsce_pracy`
  MODIFY `ID_miejsca_pracy` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  MODIFY `ID_pracownika` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `stanowisko`
--
ALTER TABLE `stanowisko`
  MODIFY `ID_stanowiska` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `stawka`
--
ALTER TABLE `stawka`
  MODIFY `ID_stawki` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  ADD CONSTRAINT `pracownicy_ibfk_1` FOREIGN KEY (`ID_kierownika`) REFERENCES `kierownicy` (`ID_kierownika`),
  ADD CONSTRAINT `pracownicy_ibfk_2` FOREIGN KEY (`ID_miejsca_pracy`) REFERENCES `miejsce_pracy` (`ID_miejsca_pracy`),
  ADD CONSTRAINT `pracownicy_ibfk_3` FOREIGN KEY (`ID_stawki`) REFERENCES `stawka` (`ID_stawki`),
  ADD CONSTRAINT `pracownicy_ibfk_4` FOREIGN KEY (`ID_stanowiska`) REFERENCES `stanowisko` (`ID_stanowiska`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
