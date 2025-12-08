Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21AEBD3B7DD
	for <qemu-rust@archiver.kernel.org>; Mon,  8 Dec 2025 07:01:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vSVF2-0001qq-A8; Mon, 08 Dec 2025 02:01:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vSVF1-0001qh-Ak
 for qemu-rust@nongnu.org; Mon, 08 Dec 2025 02:01:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vSVEz-0000cQ-Fn
 for qemu-rust@nongnu.org; Mon, 08 Dec 2025 02:01:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765177260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xrSseIg2PUVp2z3SIzNtnYubbzb5a41taM+n0lwURsk=;
 b=HltoQnHq/DeTcl+99VqKxgUF58Cnao2PDSRMgaCf/Mw8PVu9UbntsXo71Ce+S1S/VHtlvA
 7v4AUbT8k/ERcXkHM4zs/eHIAf+Ay2Ijzn913WHPWtpflW6uTd1sBRb3Bkj9XiuWNihv+g
 vR83yO0dSMDdYwDV6BiFKIuiwbmPoXE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-483-Ig4FD7ZKPme5JYga8Nuf3g-1; Mon, 08 Dec 2025 02:00:48 -0500
X-MC-Unique: Ig4FD7ZKPme5JYga8Nuf3g-1
X-Mimecast-MFC-AGG-ID: Ig4FD7ZKPme5JYga8Nuf3g_1765177247
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-42e2e3c2cccso2754445f8f.3
 for <qemu-rust@nongnu.org>; Sun, 07 Dec 2025 23:00:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765177247; x=1765782047;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xrSseIg2PUVp2z3SIzNtnYubbzb5a41taM+n0lwURsk=;
 b=GNW72+IOO5W+SIxCODZZI8a6zFScptXgm51zhrH6ewmR8GDvKF4vpfGYB+YbskpfOg
 EGxcsWe5ZSGrdrZYPJnk6v9LjzKFVTFnOUzqZnGqM9xdAS7iHxjZ/Pzfz3hkiFCb7tz/
 iHbOQj8/ECNzW1CauyPrLrjnVnKnO5+j8OubJOrsWjRAUFJG/0/40tPKBaiHcva3rglK
 6gPAlP4FG8q0HaacdS7pycAWdmZVGed1s2L3QDZKvu0Djf13H9usA4utzQUqI1IrWeX5
 3pgqlV+nX0bOeoraJ+nC9KJCjrQP0BHMZYt1hFQDlGvEvZ94T9KRBX8R52DUGFIS/bgB
 4JXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwe5maHTDnJJmVwbxRnLCTXvb8mreTEUxcQx1yus28AKVCo7mKbMuA4yWAau9MIHuvli4MMcrOmQM=@nongnu.org
X-Gm-Message-State: AOJu0YzyVifMDvnFaR+fIvPMh5AVryKkNiCcGBI0a/NxZYsmxNz1p39+
 NyUhvyYebu5AlE/r4sOgxrr8dE7Meif0QVlRwQMl6LbZTcy8z7DYxpmBsqV9E2kaGB/wOhbu6cL
 AFXMO4bMmeCavT7EWLbEDjiAVds9/AzbsmgtePjHotO/A3tdod6vORJV8GdC9n4pA/QUAXdEWMf
 sp/h33DtZ9czkxhIzQc4XBdN0pybmLMA==
X-Gm-Gg: ASbGncuHQ08sdPgPRN0bkZjla115Nbvy0uh2vBF2DPooYMcR5k5D5OGjGhjihOv2Sva
 hJ3UfnpfMuNR7zJh/4OixwZPYGNdBg+5pvnbC8faUBoQxhqvxbcGWD9nChXbkopr4mXtkwFMGYe
 xm5Hx3jDqSZOIV/urFvZi+ts3l19a3KRqk12oTI/GSsTjiOHa0KyjDJd5OQNoDWkf//Sm1CbhwT
 un154zJarCRHB4SFGh9CiUsCu8IBbwi14R5hsh2K4zIWXfa3IjpXMvYNxT/v0U1RdTx
X-Received: by 2002:a05:6000:40dc:b0:42b:3131:5436 with SMTP id
 ffacd0b85a97d-42f89f286e6mr6096966f8f.16.1765177246879; 
 Sun, 07 Dec 2025 23:00:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGw2/O3pvmKs/0J13yxjzd86YmN7D8XEmQtpx8Yxe0vecrcMHMUoHEGrkMDfHdIQf2iXYv+87jnLZlWqNnh6iY=
X-Received: by 2002:a05:6000:40dc:b0:42b:3131:5436 with SMTP id
 ffacd0b85a97d-42f89f286e6mr6096930f8f.16.1765177246339; Sun, 07 Dec 2025
 23:00:46 -0800 (PST)
MIME-Version: 1.0
References: <20251010151006.791038-1-pbonzini@redhat.com>
 <20251010151006.791038-12-pbonzini@redhat.com>
 <875xal5jnv.fsf@pond.sub.org>
 <21a2d5fb-0181-4ce8-8bea-a214c8eac2d7@redhat.com>
 <87cy4t3yzc.fsf@pond.sub.org>
In-Reply-To: <87cy4t3yzc.fsf@pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 8 Dec 2025 08:00:00 +0100
X-Gm-Features: AQt7F2pC_gg5WUJDdanL6NnpwahLwLLkbGhshqKuKGFfhVe0607VDMGYgBEpTvw
Message-ID: <CABgObfYJiBZC6jx9wQGCubC8J6Gu0Hn9q+Zo_Dm1J8PcRJDNNw@mail.gmail.com>
Subject: Re: [PATCH 11/19] rust/qobject: add from/to JSON bindings for QObject
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 "open list:Rust-related patc..." <qemu-rust@nongnu.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9GFWbzHn-0AOnfhc_6CioEwk4UcSBOhsnUxrfSCyulI_1765177247
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000bbea3006456b5a40"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

--000000000000bbea3006456b5a40
Content-Type: text/plain; charset="UTF-8"

Il ven 5 dic 2025, 13:16 Markus Armbruster <armbru@redhat.com> ha scritto:

> > Note however that there is no support for push parsing, therefore this
> > would not replace the balanced-parentheses machinery in
> > qobject/json-streamer.c, and therefore QMP would still need a minimal
> lexer.
>
> That push parser...  I never liked it.  First, it's half-assed: it's a
> push lexer wed to a pull parser with parenthesis counting.  Second, why
> complicated & half-assed when you can do simple & quarter-assed instead?
> We could've required "exactly one complete JSON value per line", or some
> expression separator such as an empty line.
>

Hmm not sure I agree, actually I think I disagree. It seems simpler but it
is also different.

Push parsing is not rocket science. It would be easy to write a proper one,
it's just that there is no real reason other than cleanliness.

> Grr... I just remembered about interpolation :/ so no, we still need a
> > parser for libqmp.c.
>
> Right.
>
> Interpolation lets us build QObjects from literal templates with
> variable scalars or QObjects interpolated.  More concise and much easier
> to read than the equivalend nest of constructor calls.  Drawback: chains
> us to our own, bespoke JSON parser.
>

And also, for similar reasons of practicality, single quotes (which IIRC
also became valid QMP, and that's less excusable).

But while it's a pity, we still get a lot from serde, namely making the
automatic generation of visitor code for structs someone else's problem.

Out of curiosity: how would we do better than "nest of constructor
> calls" in Rust?
>

You'd do that with a quoting macro, i.e.

qobject!({"command": cmd})

where the macro compiles to the nest of constructor calls, like
QObject::from_iter([(c"command", to_qobject(cmd))]).

Paolo

>

--000000000000bbea3006456b5a40
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">Il ven 5 dic 2025, 13:16 Markus =
Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>&g=
t; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&=
gt; Note however that there is no support for push parsing, therefore this =
<br>
&gt; would not replace the balanced-parentheses machinery in <br>
&gt; qobject/json-streamer.c, and therefore QMP would still need a minimal =
lexer.<br>
<br>
That push parser...=C2=A0 I never liked it.=C2=A0 First, it&#39;s half-asse=
d: it&#39;s a<br>
push lexer wed to a pull parser with parenthesis counting.=C2=A0 Second, wh=
y<br>
complicated &amp; half-assed when you can do simple &amp; quarter-assed ins=
tead?<br>
We could&#39;ve required &quot;exactly one complete JSON value per line&quo=
t;, or some<br>
expression separator such as an empty line.<br></blockquote></div></div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">Hmm not sure I agree, actually I=
 think I disagree. It seems simpler but it is also different.=C2=A0</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">Push parsing is not rocket scie=
nce. It would be easy to write a proper one, it&#39;s just that there is no=
 real reason other than cleanliness.</div><div dir=3D"auto"><br></div><div =
dir=3D"auto"><div class=3D"gmail_quote gmail_quote_container"><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">&gt; Grr... I just remembered about in=
terpolation :/ so no, we still need a <br>
&gt; parser for libqmp.c.<br>
<br>
Right.<br>
<br>
Interpolation lets us build QObjects from literal templates with<br>
variable scalars or QObjects interpolated.=C2=A0 More concise and much easi=
er<br>
to read than the equivalend nest of constructor calls.=C2=A0 Drawback: chai=
ns<br>
us to our own, bespoke JSON parser.<br></blockquote></div></div><div dir=3D=
"auto"><br></div><div dir=3D"auto">And also, for similar reasons of practic=
ality, single quotes (which IIRC also became valid QMP, and that&#39;s less=
 excusable).</div><div dir=3D"auto"><br></div><div dir=3D"auto">But while i=
t&#39;s a pity, we still get a lot from serde, namely making the automatic =
generation of visitor code for structs someone else&#39;s problem.</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote gmail_=
quote_container"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Out of curiosity: how would we do better than &quot;nest of constructor<br>
calls&quot; in Rust?<br></blockquote></div></div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">You&#39;d do that with a quoting macro, i.e.=C2=A0</div=
><div dir=3D"auto"><br></div><div dir=3D"auto">qobject!({&quot;command&quot=
;: cmd})</div><div dir=3D"auto"><br></div><div dir=3D"auto">where the macro=
 compiles to the nest of constructor calls, like QObject::from_iter([(c&quo=
t;command&quot;, to_qobject(cmd))]).</div><div dir=3D"auto"><br></div><div =
dir=3D"auto">Paolo</div><div dir=3D"auto"><div class=3D"gmail_quote gmail_q=
uote_container"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
</blockquote></div></div></div>

--000000000000bbea3006456b5a40--


