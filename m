Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uIBMg-0005Qn-IM
	for mharc-qemu-rust@gnu.org; Thu, 22 May 2025 15:14:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1uIBMe-0005Ps-2T
 for qemu-rust@nongnu.org; Thu, 22 May 2025 15:14:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1uIBMc-0007rM-5m
 for qemu-rust@nongnu.org; Thu, 22 May 2025 15:13:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747941236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HSSnnoEK2d+vdgFQbD5XNON7KKR4YZRVpFajvpeRFFM=;
 b=Hd9eAwl5c3LQDU8hb4uXGpaCYQd5YcYVE3G897taipeO8gtIyAe6slbyJ9z2tGa38TiJ3o
 RHQw5fTEdbs++yILeDc7zNnBaIp8IpVMOffX8+koYrom4upKqqWJMfLXRWhKM2xPNTMOdb
 +wgBEanAGMQtje1G0mTaKhAA9cRsByc=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-icI1dE_rNl-PDFyPbVi97Q-1; Thu, 22 May 2025 15:13:54 -0400
X-MC-Unique: icI1dE_rNl-PDFyPbVi97Q-1
X-Mimecast-MFC-AGG-ID: icI1dE_rNl-PDFyPbVi97Q_1747941233
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-22de54b0b97so79906215ad.2
 for <qemu-rust@nongnu.org>; Thu, 22 May 2025 12:13:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747941233; x=1748546033;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HSSnnoEK2d+vdgFQbD5XNON7KKR4YZRVpFajvpeRFFM=;
 b=tmzExMw5yXJmopok3COTaM284Vg1/HWGA0FiDXpG/a1+89cQfKo5OkWM2tN+AkR7K6
 srQ5CnVOwouvLTpxCA9ojl3cPEZe7jJrd5vCHDEFFraZilYeenHHNraqofEL4NTLaawZ
 jEui7irujbLigCNrbw5O8PYwuLzZ2teeRvhptuRXDKhQfVioqzbHNzGTFPj0hMX1FMRq
 HxIasoy2vy6+aZAgqKSMIrcxzhcxP017yBXGW5KIb90XXrlQ0AWGoaTJSsfRTtMNQcpE
 KgL8XT4ruE9JEb5WnExokjOI3YJFhlnWLsqAs/THoC4z7ISomde/mZMu7JLjyYnfhZcM
 TVXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVut1nyCaYY0vYqrA7rhY8rBnob6hSwl+mGPBdQBxJqgYEKUtaXd6w87n2pV2epbOsS00o+pWSyb1w=@nongnu.org
X-Gm-Message-State: AOJu0YwMluFFutP4W+veWyjoKqzsJDg0m1g+a3Wv1I4l8bfYCHfYfn0W
 v6DhKfD6H+9qpwbzmpHtrCR2B579WKVZUU9ED+9DYi6E78+cjeAw1OJAUAM2hnHoPHWFHT/JBHB
 usdA6v5kjzP2RiaCrAz00XtQltBHUlQv9dbmHovmb0b86/mjo5LGq02A1eYB3kc3zvoaBmHWJU9
 Vl9vtE/6Y3Sg8FsWALsjuKn3uJ3x6Ccg==
X-Gm-Gg: ASbGncu1WIgYcxA3F+4l7JpNdN3P++n4cbVZoM2IQ6rDQxA6kswJSOBTULwZ8NMBXeS
 mHlbSt9v2Sdv2ZxtqIkkQbXWrYqsqgPAe3mSmTopsWdQG/bj1iuTzCJIqANvIkdS93aq00CvYiV
 GhX8MikYv/q/n7rzO7q74+cSHL
X-Received: by 2002:a17:902:f551:b0:227:eb61:34b8 with SMTP id
 d9443c01a7336-231de31b3e6mr374006925ad.25.1747941233063; 
 Thu, 22 May 2025 12:13:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYgXmi1Jtqf68xRCZo1FeaIysHc2TICFE2Sh78xVzHAbM/Pnw2Te2JHy4qK2DZKsns8N4x+ngM/YqYzulkKyA=
X-Received: by 2002:a17:902:f551:b0:227:eb61:34b8 with SMTP id
 d9443c01a7336-231de31b3e6mr374006555ad.25.1747941232747; Thu, 22 May 2025
 12:13:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250519182153.3835722-1-jsnow@redhat.com>
 <20250519182153.3835722-6-jsnow@redhat.com>
 <87r00jaaso.fsf@pond.sub.org>
In-Reply-To: <87r00jaaso.fsf@pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Thu, 22 May 2025 15:13:40 -0400
X-Gm-Features: AX0GCFsxPYV6IherBtyKwNjC8zyT-T273S-VqY808FMMfnkktY9Afhx0sSkaob4
Message-ID: <CAFn=p-Zo5urERRMzLWpa9mQCsv8Sa5ujmO1OkVRrr2TRRMWLEA@mail.gmail.com>
Subject: Re: [PATCH 5/8] python: convert remaining deprecated type hints for
 3.9+
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Peter Maydell <peter.maydell@linaro.org>, Hanna Reitz <hreitz@redhat.com>, 
 Ani Sinha <anisinha@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, qemu-block@nongnu.org, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-rust@nongnu.org, 
 Maksim Davydov <davydov-max@yandex-team.ru>, Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Kevin Wolf <kwolf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: A_Qz8QIGprN8FsZWWaijoZ9lI1EahANt2pT3QADyg9Y_1747941233
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000004448530635be4832"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.275,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 22 May 2025 19:14:00 -0000

--0000000000004448530635be4832
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 5:31=E2=80=AFAM Markus Armbruster <armbru@redhat.co=
m> wrote:

> John Snow <jsnow@redhat.com> writes:
>
> > In this patch, we don't have a builtin type to use for a type hint, but
> > we do have collections.abc and other standard library types. Replace
> > deprecated type hints with their standard library equivalents:
> >
> > typing.Awaitable      =3D> collections.abc.Awaitable
> > typing.AbstractSet    =3D> collections.abc.AbstractSet
> > typing.AsyncIterator  =3D> collections.abc.AsyncIterator
> > typing.Callable       =3D> collections.abc.Callable
> > typing.Coroutine      =3D> collections.abc.Coroutine
> > typing.Deque          =3D> collections.deque
> > typing.Generator      =3D> collections.abc.Generator
> > typing.Iterable       =3D> collections.abc.Iterable
> > typing.Iterator       =3D> collections.abc.Iterator
> > typing.Mapping        =3D> collections.abc.Mapping
> > typing.Match          =3D> re.Match
> > typing.MutableMapping =3D> collections.abc.MutableMapping
> > typing.Sequence       =3D> collections.abc.Sequence
> > typing.ValuesView     =3D> collections.abc.ValuesView
> >
> > The primary benefit of this is, of course, that the standard type can
> > now be used directly as the type hint. In general, this means far fewer
> > imports from `typing`. The reason we *have* to do this is because the
> > old type hints have been deprecated and will be dropped from a Python
> > release in the future, so I am just getting ahead of it before it cause=
s
> > a problem.
> >
> > (Granted, yes, in practice this just means we're usually importing from
> > collections.abc instead of typing, but... ah well. What are you gonna
> > do.)
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
>
> I'd expect to catch mistakes in the manual parts.  I gave scripts/qapi/
> an eye-over anyway, and it looks good to me.
>
> Acked-by: Markus Armbruster <armbru@redhat.com>
>
> Typing imports left at the end of the series:
>
>     *
>     Any
>     BinaryIO
>     Generic
>     IO
>     Literal
>     NamedTuple
>     NewType
>     NoReturn
>     Optional
>     Protocol
>     TYPE_CHECKING
>     TextIO
>     TypeVar
>     Union
>     cast
>

Yep, all of these are good. Except the *.


>
> The * are in scripts/codeconverter/.  You might want to double-check
> nothing deprecated hides behind the *.
>

Yep. Meant to, forgot. O:-) Thanks for the callout.


>
> The others are all still good, I presume.


Yep! I double-checked the list and none of the remaining ones here are
deprecated.

--js

--0000000000004448530635be4832
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, May 20,=
 2025 at 5:31=E2=80=AFAM Markus Armbruster &lt;<a href=3D"mailto:armbru@red=
hat.com">armbru@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">John Snow &lt;<a href=3D"mailto:jsnow@redhat.com"=
 target=3D"_blank">jsnow@redhat.com</a>&gt; writes:<br>
<br>
&gt; In this patch, we don&#39;t have a builtin type to use for a type hint=
, but<br>
&gt; we do have collections.abc and other standard library types. Replace<b=
r>
&gt; deprecated type hints with their standard library equivalents:<br>
&gt;<br>
&gt; typing.Awaitable=C2=A0 =C2=A0 =C2=A0 =3D&gt; collections.abc.Awaitable=
<br>
&gt; typing.AbstractSet=C2=A0 =C2=A0 =3D&gt; collections.abc.AbstractSet<br=
>
&gt; typing.AsyncIterator=C2=A0 =3D&gt; collections.abc.AsyncIterator<br>
&gt; typing.Callable=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D&gt; collections.abc.Call=
able<br>
&gt; typing.Coroutine=C2=A0 =C2=A0 =C2=A0 =3D&gt; collections.abc.Coroutine=
<br>
&gt; typing.Deque=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D&gt; collections.deq=
ue<br>
&gt; typing.Generator=C2=A0 =C2=A0 =C2=A0 =3D&gt; collections.abc.Generator=
<br>
&gt; typing.Iterable=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D&gt; collections.abc.Iter=
able<br>
&gt; typing.Iterator=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D&gt; collections.abc.Iter=
ator<br>
&gt; typing.Mapping=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D&gt; collections.abc.Mapp=
ing<br>
&gt; typing.Match=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D&gt; re.Match<br>
&gt; typing.MutableMapping =3D&gt; collections.abc.MutableMapping<br>
&gt; typing.Sequence=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D&gt; collections.abc.Sequ=
ence<br>
&gt; typing.ValuesView=C2=A0 =C2=A0 =C2=A0=3D&gt; collections.abc.ValuesVie=
w<br>
&gt;<br>
&gt; The primary benefit of this is, of course, that the standard type can<=
br>
&gt; now be used directly as the type hint. In general, this means far fewe=
r<br>
&gt; imports from `typing`. The reason we *have* to do this is because the<=
br>
&gt; old type hints have been deprecated and will be dropped from a Python<=
br>
&gt; release in the future, so I am just getting ahead of it before it caus=
es<br>
&gt; a problem.<br>
&gt;<br>
&gt; (Granted, yes, in practice this just means we&#39;re usually importing=
 from<br>
&gt; collections.abc instead of typing, but... ah well. What are you gonna<=
br>
&gt; do.)<br>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
<br>
I&#39;d expect to catch mistakes in the manual parts.=C2=A0 I gave scripts/=
qapi/<br>
an eye-over anyway, and it looks good to me.<br>
<br>
Acked-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" target=
=3D"_blank">armbru@redhat.com</a>&gt;<br>
<br>
Typing imports left at the end of the series:<br>
<br>
=C2=A0 =C2=A0 *<br>
=C2=A0 =C2=A0 Any<br>
=C2=A0 =C2=A0 BinaryIO<br>
=C2=A0 =C2=A0 Generic<br>
=C2=A0 =C2=A0 IO<br>
=C2=A0 =C2=A0 Literal<br>
=C2=A0 =C2=A0 NamedTuple<br>
=C2=A0 =C2=A0 NewType<br>
=C2=A0 =C2=A0 NoReturn<br>
=C2=A0 =C2=A0 Optional<br>
=C2=A0 =C2=A0 Protocol<br>
=C2=A0 =C2=A0 TYPE_CHECKING<br>
=C2=A0 =C2=A0 TextIO<br>
=C2=A0 =C2=A0 TypeVar<br>
=C2=A0 =C2=A0 Union<br>
=C2=A0 =C2=A0 cast<br></blockquote><div><br></div><div>Yep, all of these ar=
e good. Except the *.</div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
<br>
The * are in scripts/codeconverter/.=C2=A0 You might want to double-check<b=
r>
nothing deprecated hides behind the *.<br></blockquote><div><br></div><div>=
Yep. Meant to, forgot. O:-) Thanks for the callout.</div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
The others are all still good, I presume.</blockquote><div><br></div><div>Y=
ep! I double-checked the list and none of the remaining ones here are depre=
cated.</div><div><br></div><div>--js <br></div></div></div>

--0000000000004448530635be4832--


