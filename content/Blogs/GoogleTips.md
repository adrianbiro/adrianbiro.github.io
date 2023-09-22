# Google tips

## Export search engines from Chrome as CSV

Windows

```pwsh
C:\> sqlite3.exe -csv "$ENV:LOCALAPPDATA\Google\Chrome\User Data\Default\Web Data” "select short_name,keyword,replace(url,'{searchTerms}','%s') from keywords;" > engines.csv
```

Linux

```bash
sqlite3 -csv ~/.config/google-chrome/Default/Web\ Data "select short_name,keyword,replace(url,'{searchTerms}','%s') from keywords;" > engines.csv
```

Sample output

```csv
GitHub,gh,https://github.com/search?q=%s&ref=opensearch
"linux man pages",man,https://www.die.net/search/?q=%s
"tanium community",tanium,https://community.tanium.com/s/global-search/%s
"Google Maps",gmaps,https://www.google.com/maps/search/%s?hl=en&source=opensearch
```

## Show keyboard shortcuts in gmail and calendar

`Shift ?`

## [Search in gmail](https://support.google.com/mail/answer/7190?hl=en)

`Settings > Inbox > Inbox type > Multiple inboxes`

```txt
in:inboxnewer_than:1d
in:inbox older_than:1d newer_than:2d 
in:inbox older_than:2d newer_than:7d
in:inbox older_than:7d
in:inbox older_than:30d
din:inbox older_than:7d
```

| What you can search by | Search operator & example |
| --- | --- |
| Specify the sender | from:Luk |
| Specify a recipient | to:
| Specify a recipient who received a copy | cc: bcc: |
| Words in the subject line | subject: |
| Messages that match multiple terms | OR or { } from:amy OR from:david {from:amy from:david} |
| Remove messages from your results | -movie |
| Find messages with words near each other. Use the number to say how many words apart the words can be | holiday AROUND 10 vacation |
Add quotes to find messages in which the word you put first stays first. |  "secret AROUND 25 birthday" |
| Messages that have a certain label | label: |
| Messages that have an attachment | has:attachment |
| Messages that have a Google Drive, Docs, Sheets, or Slides attachment or link | has:drive has:document has:spreadsheet has:presentation has:youtube|
| Messages from a mailing list | list:info@example.com|
| Attachments with a certain name or file type | filename:pdf filename:text.txt |
| Search for an exact word or phrase | "dinner and movie tonight" |
| Group multiple search terms together | subject:(dinner movie) |
| Messages in any folder, including Spam and Trash | in:anywhere movie |
| Search for messages that are marked as important | is:important label:important |
| Starred, snoozed, unread, or read messages | is:starred is:snoozed is:unread is:read |
| Messages that include an icon of a certain color | has:yellow-star has:blue-info |
| Recipients in the cc or bcc field | cc:Julo bcc: Note: You can't find messages that you received on bcc. |
| Search for messages sent during a certain time period | after: before: older: newer:2004/04/16 |
| Search for messages older or newer than a time period using d (day), m (month), and y (year) | older_than: newer_than:2d |
| Search by email for delivered messages | deliveredto: |
| Messages in a certain category | category: social |
| Messages larger than a certain size in bytes | size:10000000 |
| Messages larger or smaller than a certain size in bytes | larger: smaller: 10M |
| Results that match a word exactly | +unicorn |
| Messages with a certain message-id header | rfc822msgid:200503292@example.com |
| Messages that have or don't have a label | has:userlabels has:nouserlabels |

_Note: When using numbers as part of your query, a space or a dash (-) will separate a number while a dot (.) will be a decimal. For example, 01.2047-100 is considered 2 numbers: 01.2047 and 100._
