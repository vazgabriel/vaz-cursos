import 'package:vaz_cursos/models/course.dart';
import 'package:vaz_cursos/models/course_class.dart';
import 'package:vaz_cursos/models/course_rate.dart';
import 'package:vaz_cursos/models/user.dart';

var gabriel = User(
  id: 1,
  name: 'Gabriel Vaz',
  email: 'gabrielcvaz@outlook.com',
  profileImage:
      'https://yt3.ggpht.com/a/AATXAJyeErG_4q7sOv61ADDdQOUROxCaoMAESLEB8A=s176-c-k-c0xffffffff-no-rj-mo',
  createdAt: '2020-06-21 15:40:11',
  shortDescription: 'Software Engineer a mais de 3 anos',
  description: 'Software Engineer a mais de 3 anos, ...',
  rate: 4.78,
  reviews: 34,
  students: 135,
  courses: 1,
);

var reviews = [
  CourseRate(
    id: 1,
    description: 'Curso show de bola',
    rate: 5,
    ratedBy: gabriel,
    createdAt: DateTime.now(),
  )
];

var classes = [
  CourseClass(
    id: 1,
    title: 'Tutorial Flutter #1 - O que é flutter? Introdução, e hello world',
    watched: true,
    youtubeId: 'lIF7yXNYa3o',
    description:
        'Repositório do curso: https://github.com/vazgabriel/flutter-course',
  ),
  CourseClass(
    id: 2,
    title:
        'Tutorial Flutter #2 - Organizando código, primeiro Widget e controle de estado',
    watched: true,
    youtubeId: 'JnP9PD53Oz4',
    description:
        'Repositório do curso: https://github.com/vazgabriel/flutter-course',
  ),
  CourseClass(
    id: 3,
    title: 'Tutorial Flutter #3 - Bibliotecas no flutter e Repositório Github',
    watched: false,
    youtubeId: 'mbBeyiPNf30',
    description:
        'Repositório do curso: https://github.com/vazgabriel/flutter-course',
  ),
  CourseClass(
    id: 4,
    title:
        'Tutorial Flutter #4 - Buscando repositórios Github API e Dart Models',
    watched: false,
    youtubeId: '0YtOgE81OB0',
    description:
        'Repositório do curso: https://github.com/vazgabriel/flutter-course',
  ),
  CourseClass(
    id: 5,
    title: 'Tutorial Flutter #5 - Listando elementos e validação do formulário',
    watched: false,
    youtubeId: 'dE9_U-G9t28',
    description:
        'Repositório do curso: https://github.com/vazgabriel/flutter-course',
  ),
  CourseClass(
    id: 6,
    title:
        'Tutorial Flutter #6 - Abrindo link, utilizando imagens, cache e loading',
    watched: false,
    youtubeId: '8YohXOJAei4',
    description:
        'Repositório do curso: https://github.com/vazgabriel/flutter-course',
  ),
  CourseClass(
    id: 7,
    title: 'Tutorial Flutter #6.1 - Problemas com Imagem e descrição',
    watched: false,
    youtubeId: 'bqrtKUEz2U0',
    description:
        'Repositório do curso: https://github.com/vazgabriel/flutter-course',
  ),
  CourseClass(
    id: 8,
    title: 'Tutorial Flutter #7 - Infinite Scroll, Navegação e Animação Imagem',
    watched: false,
    youtubeId: 'o6zl3wVDva0',
    description:
        'Repositório do curso: https://github.com/vazgabriel/flutter-course',
  ),
];

var courses = [
  Course(
    id: 1,
    name: 'Curso Flutter',
    thumbnailUrl:
        'https://i.ytimg.com/vi/lIF7yXNYa3o/hqdefault.jpg?sqp=-oaymwEZCPYBEIoBSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLCCJX4KuI9cVWmc0ddJxwvn7TvIJQ',
    shortDescription:
        'Aprenda a fazer aplicativos multiplataforma de alta performance',
    description:
        'Aprenda a fazer aplicativos multiplataforma de alta performance, ...',
    requirements: ['Básico de programação', 'Básico de orientação a objeto'],
    learnship: ['Criação de aplicativos Flutter', 'Animações', 'API'],
    teacher: gabriel,
    minutes: 293,
    rate: 4.78,
    students: 135,
    totalReviews: 34,
    reviews: reviews,
    classes: classes,
  ),
];
