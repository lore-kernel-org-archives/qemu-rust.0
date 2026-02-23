Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC96EC1120
	for <qemu-rust@archiver.kernel.org>; Mon, 23 Feb 2026 19:04:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vubDs-0001bm-6G; Mon, 23 Feb 2026 14:04:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vubDZ-0001aL-SQ
 for qemu-rust@nongnu.org; Mon, 23 Feb 2026 14:03:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vubDX-0002KM-HP
 for qemu-rust@nongnu.org; Mon, 23 Feb 2026 14:03:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1771873418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zMX441P8bJLBwKEWs+mbAHs0IPb96AAA7l7/0evWMaw=;
 b=MY5C2IoMDWul8kxbBLIOfXxu6mA3Ut9yHwf1zi8Gw7eG9OCtMh05QrkmH8zY3UlHeqOqE3
 1Dy6SlIxpCZTsInADRdhJhejXjIblm62bWkGRmsUMYqEimvzw5Gp7/e9YCbH74HZy5Z0e3
 FgfaXFarhurZB1WzpPMOOZ/kCVbOSpc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-530--efgcdPlOk-gz3Nil433tg-1; Mon, 23 Feb 2026 14:03:36 -0500
X-MC-Unique: -efgcdPlOk-gz3Nil433tg-1
X-Mimecast-MFC-AGG-ID: -efgcdPlOk-gz3Nil433tg_1771873415
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-4358f90fe8dso3341223f8f.0
 for <qemu-rust@nongnu.org>; Mon, 23 Feb 2026 11:03:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771873415; x=1772478215;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zMX441P8bJLBwKEWs+mbAHs0IPb96AAA7l7/0evWMaw=;
 b=QSls2oamZpf2RHl/sp6sAWWuvaQlEWcyM/mIx9HNhsyzMc/7SAzRd6CJqMmisxHvnu
 RyzR4U9B8jC7XGgXYTxweJtg4RFpxqjVGkWV7z7QZrLBW84pr27RuFnlSCoCIfigBnj0
 dM+YUzsSK33OeDVuruOFAWBlZ1lce85nlgiu2X1IgmNp+RVGtqPPiMcuoPkeNUE5zPPS
 C3LsHDa4yrxZ80lW2mCUefBUsY91FsX6M0WApmLY/+4tT3Y/qqVhE/3nLwW6hz6/n4Bm
 VZY7jWtfZPVtYC0bPFcRGXNeIhnMByyl0la3Npo8wBleqz1Fxtp324V8zOQIAI74Qvzc
 sBYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6fuXV9bI/sNNoz3Z8ExiGYUAUga0wfecroRpp6NPb/AC7/uANWlEY3QwS1J11cN4FDIQ0uODiKUk=@nongnu.org
X-Gm-Message-State: AOJu0YzvdEGqJSnC9iVWQeTP4wGjYL7bhWfJDK7gJPpg1Mk/N/inI9BV
 J9stiSo6rRUilhIJdWXIjI5Aou8uee07SWxcVkYWwpqw3UzIlgIRmUtggNfZFDYBqPG7ZgaE7KE
 py0wFkeKYa60cqTwDoUszr0M0I+sd/zgpqqMylMcfX1HQnyjb7d4x3Fw63IQV+ZfW9FRp+OuG1L
 TjO1LGoUCWwavIYDerG3VJJYWY6ULSGw==
X-Gm-Gg: ATEYQzyI9GHyzYFe4AfDww2/jzXBt9F/Ax6p+lOIEs91oMyA6qOITqBfzSUqZe69Tn6
 VcTQOnmihWYiikF0ZVXYu6UdewxWTr23BDztJZF7OyzQ0gTiPAi7v0X3Hgfu+ejPcEOGnVWyC+p
 LYz3lDnU5AQO9YE35LhwHCY38aDMLVpGlAmsjTOwf3zDzY1C8cdqm2NREq6vnBuI4uLWsn5CBI/
 ounDIc5LEjF7u9wjooUmiBi/s2oPJnIoS88AFd0Sqpe5qFYCI22gPYsKiSO4mYySP8L+seqKfjG
 Szm+Ytg=
X-Received: by 2002:a05:6000:290e:b0:432:5a4e:c023 with SMTP id
 ffacd0b85a97d-4396ffc46camr16991620f8f.13.1771873415227; 
 Mon, 23 Feb 2026 11:03:35 -0800 (PST)
X-Received: by 2002:a05:6000:290e:b0:432:5a4e:c023 with SMTP id
 ffacd0b85a97d-4396ffc46camr16991567f8f.13.1771873414776; Mon, 23 Feb 2026
 11:03:34 -0800 (PST)
MIME-Version: 1.0
References: <20260108131043.490084-1-pbonzini@redhat.com>
 <aZwjpfu-qCCSoHdx@redhat.com>
 <bedbf511-c46a-4468-bf65-cc452c621765@redhat.com>
 <aZx_Wy1-eBsTEB1s@redhat.com>
In-Reply-To: <aZx_Wy1-eBsTEB1s@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 23 Feb 2026 20:03:21 +0100
X-Gm-Features: AaiRm526srvpqunoMtw2m9ysXVzlAHRI_ao03hwkMOeuomM6mFKrXVnmY1rc75Y
Message-ID: <CABgObfa7ur+jjQjjm8hacNJZ92YJ3G7vzugxzw0oQ1FsSM-Uaw@mail.gmail.com>
Subject: Re: [PATCH v2 00/16] rust: QObject and QAPI bindings
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Armbruster,
 Markus" <armbru@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 "open list:Rust-related patc..." <qemu-rust@nongnu.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aWtyDZKOOsUDedGgAi1PMgT64fkSOzkGtIkilsycv6s_1771873415
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000799a61064b826d43"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=1.179,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.717, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-rust@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: QEMU Rust-related patches and discussion <qemu-rust.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-rust>
List-Post: <mailto:qemu-rust@nongnu.org>
List-Help: <mailto:qemu-rust-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=subscribe>
Errors-To: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org

--000000000000799a61064b826d43
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il lun 23 feb 2026, 17:25 Daniel P. Berrang=C3=A9 <berrange@redhat.com> ha
scritto:

> I guess the thing I'm wondering about when I ask about the big picture
> is to understand tne interoperability implications of this impl approach,
> given the starting point that the Rust & C structs are *not* ABI
> compatible.
>
> If we're anticipating that the Rust usage flows up from a Rust QMP comman=
d
> handler, then the data is in the Rust struct right from the entry point
> and perhaps the interoperability needs are reduced in scope.
>
> If we're anticipating a calls back & forth between C & Rust code, that
> directly handle the deserialized structs, then we have an open interop
> question. Is the implication that we round-trip via JSON every time we
> need to swap between a Rust struct and C struct for a given type ?


Right now yes.

Or
> will we have a direct struct<->struct conversion mechanism ? Or is there
> something else entirely ?
>

Marc-Andr=C3=A9 had such a conversion mechanism in his patches. However I w=
ould
not include it unless there's a need. Generally speaking I don't expect
anything involving QAPI to be performance critical.

I feel a bit lost in how to evaluate this series without seeing some
> real world usage, in a way that exposes the possible implications of
> the lack of C/Rust ABI compat in the structs.
>

Yes, I understand and it's a recurrent problem with all the Rust
infrastructure, it's hard to evaluate it beyond test cases. Right now my
best hope for a first user would be either QMP commands, or the block layer=
.

Paolo


> With regards,
> Daniel
> --
> |: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
> |: https://libvirt.org          ~~          https://entangle-photo.org :|
> |: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|
>
>

--000000000000799a61064b826d43
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">Il lun 23 feb 2026, 17:25 Daniel=
 P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@redha=
t.com</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">I guess the thing I&#39;m wondering about when I ask about the b=
ig picture<br>
is to understand tne interoperability implications of this impl approach,<b=
r>
given the starting point that the Rust &amp; C structs are *not* ABI compat=
ible.<br>
<br>
If we&#39;re anticipating that the Rust usage flows up from a Rust QMP comm=
and<br>
handler, then the data is in the Rust struct right from the entry point<br>
and perhaps the interoperability needs are reduced in scope.<br>
<br>
If we&#39;re anticipating a calls back &amp; forth between C &amp; Rust cod=
e, that<br>
directly handle the deserialized structs, then we have an open interop<br>
question. Is the implication that we round-trip via JSON every time we<br>
need to swap between a Rust struct and C struct for a given type ?</blockqu=
ote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Right now yes=
.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_qu=
ote gmail_quote_container"><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"> Or<br>
will we have a direct struct&lt;-&gt;struct conversion mechanism ? Or is th=
ere<br>
something else entirely ?<br></blockquote></div></div><div dir=3D"auto"><br=
></div><div dir=3D"auto">Marc-Andr=C3=A9 had such a conversion mechanism in=
 his patches. However I would not include it unless there&#39;s a need. Gen=
erally speaking I don&#39;t expect anything involving QAPI to be performanc=
e critical.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=
=3D"gmail_quote gmail_quote_container"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">I feel a bit lost in how to evaluate this series without seei=
ng some<br>
real world usage, in a way that exposes the possible implications of<br>
the lack of C/Rust ABI compat in the structs.<br></blockquote></div></div><=
div dir=3D"auto"><br></div><div dir=3D"auto">Yes, I understand and it&#39;s=
 a recurrent problem with all the Rust infrastructure, it&#39;s hard to eva=
luate it beyond test cases. Right now my best hope for a first user would b=
e either QMP commands, or the block layer.</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">Paolo=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D=
"auto"><div class=3D"gmail_quote gmail_quote_container"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
With regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer noreferrer" target=3D=
"_blank">https://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0~~=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 <a href=3D"https://hachyderm.io/@berrange" rel=3D"noreferrer=
 noreferrer" target=3D"_blank">https://hachyderm.io/@berrange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer noreferrer" target=3D"=
_blank">https://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~~=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://entangle-photo.org" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">https://entangle-photo.org</a> :|<b=
r>
|: <a href=3D"https://pixelfed.art/berrange" rel=3D"noreferrer noreferrer" =
target=3D"_blank">https://pixelfed.art/berrange</a>=C2=A0 =C2=A0~~=C2=A0 =
=C2=A0 <a href=3D"https://fstop138.berrange.com" rel=3D"noreferrer noreferr=
er" target=3D"_blank">https://fstop138.berrange.com</a> :|<br>
<br>
</blockquote></div></div></div>

--000000000000799a61064b826d43--


