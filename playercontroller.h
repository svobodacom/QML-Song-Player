#ifndef PLAYERCONTROLLER_H
#define PLAYERCONTROLLER_H

#include <QMediaPlayer>
#include <QObject>

class PlayerController : public QObject
{
    Q_OBJECT

    Q_PROPERTY(int currentSongIndex READ currentSongIndex NOTIFY currentSongIndexChanged)
    Q_PROPERTY(int songCount READ songCount NOTIFY songCountChanged)
    Q_PROPERTY(bool playing READ playing NOTIFY playingChanged)


public:
    explicit PlayerController(QObject *parent = nullptr);

    int currentSongIndex() const;
    int songCount() const;
    bool playing() const;

    // first way to expose C++ functions to QML using Q_INVOKABLE macro
    Q_INVOKABLE void switchToNextSong();

public slots:
    // second way to expose C++ functions to QML put them to public slots modificator
    void switchToPreviousSong();
    void playPause();
    void changeAudioSource(const QUrl &source);

signals:

    void currentSongIndexChanged();
    void songCountChanged();
    void playingChanged();

private:
    int m_currentSongIndex = 0;
    int m_songCount = 3;
    bool m_playing = false;
    QMediaPlayer m_mediaPlayer;
};

#endif // PLAYERCONTROLLER_H
