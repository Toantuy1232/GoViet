package toan.dev.data.model;

import java.sql.Timestamp;

public class Chatmessages {
    public int message_id;
    public int sender_id;
    public int receiver_id;
    public String content;
    public Timestamp sent_at;

    public Chatmessages(int id, int messageId, int senderId, int receiverId, String content, Timestamp sentAt) {
        super();
        this.message_id = messageId;
        this.sender_id = senderId;
        this.receiver_id = receiverId;
        this.content = content;
        this.sent_at = sentAt;
    }

    public int getMessage_id() {
        return message_id;
    }

    public void setMessage_id(int message_id) {
        this.message_id = message_id;
    }

    public int getSender_id() {
        return sender_id;
    }

    public void setSender_id(int sender_id) {
        this.sender_id = sender_id;
    }

    public int getReceiver_id() {
        return receiver_id;
    }

    public void setReceiver_id(int receiver_id) {
        this.receiver_id = receiver_id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getSent_at() {
        return sent_at;
    }

    public void setSent_at(Timestamp sent_at) {
        this.sent_at = sent_at;
    }

    public Chatmessages(int message_id, int sender_id, int receiver_id, String content, Timestamp sent_at) {
        this.message_id = message_id;
        this.sender_id = sender_id;
        this.receiver_id = receiver_id;
        this.content = content;
        this.sent_at = sent_at;
    }
}
