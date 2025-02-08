Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tgjC4-0003tA-1y
	for mharc-qemu-rust@gnu.org; Sat, 08 Feb 2025 06:40:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tgjC1-0003qB-0Z
 for qemu-rust@nongnu.org; Sat, 08 Feb 2025 06:40:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tgjBz-0007ea-3f
 for qemu-rust@nongnu.org; Sat, 08 Feb 2025 06:40:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739014808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/3mXv4ELeiC2V6JPgnHvkqvzAX/X9skwIErg2J5nckg=;
 b=fm918Pt1ilBp/ytvkBxrb2RbzLOt7eX6RNPqEC3/55fRoxGeWEDMGUITYO7+mBndraxwJa
 4JRCjMqUB6MqgspVTC/QUYEzEoA+u8nple4I2XppZDKEqI4DwPI9TReT7MOqU3QLioZGnE
 CGVAauj6e3K/jYuj9DIBHX2bnmxFc/0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-378-U0riWH2WOxObfTjHnQBY3A-1; Sat, 08 Feb 2025 06:40:03 -0500
X-MC-Unique: U0riWH2WOxObfTjHnQBY3A-1
X-Mimecast-MFC-AGG-ID: U0riWH2WOxObfTjHnQBY3A
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43935bcec79so726875e9.3
 for <qemu-rust@nongnu.org>; Sat, 08 Feb 2025 03:40:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739014803; x=1739619603;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/3mXv4ELeiC2V6JPgnHvkqvzAX/X9skwIErg2J5nckg=;
 b=YCu88tVF/35sfDYZAv3cAm8j+s20tSf2vscH5ulfYkNK9+MWry5wu3aZfYeov6doC2
 VxjfUDKbXsxsrLZ9gPqjN+BYjG2le4ge0HqtpzB6JLWZkvhSCUIDjbCJsskcAYeuuJyo
 AxvKYAdT4/L5nyl0whjkw1bkkh33ka7c/mNF79zAZCRezxXfGnJDQop9MSxMkuY3aNRT
 M24H+MnvWmQR3OWp0TfPMzrfz9xhDn6hVvzvjqKoaAiPWyITaob6g70SgvYbXl2O8hHg
 1qu9DxWt1iypiPvDTFZE6IqVsnk+8Q1FEwz8TiHQD/iSiX8z6QxTJKtFSBM2Pk6qxTUZ
 iVXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyAGSYLHHezIv4U0T4ZH9GNvUyso5jpA1/AtveyQWgulI+Of9fBql51f9m/8knAaS3bjgDZPuxMsQ=@nongnu.org
X-Gm-Message-State: AOJu0Yx/0utk3dAY7nk01/0pvcf3vtF5dWONWlD7+EFlmDU1X+FtTBKR
 PfUI+dZFD/iWQFvAASSHNiPZbPBcXi+6t8DlyvnumBma8/IUSJEvVFjFNMfM8UMY/2gGsnYz6aZ
 4nG0PG8UYibZ5usblMv/wezyf2/WPjyOlMdqEa4IZTlilv90QR94fXferdts5cLYFNkitRBkiKO
 9jALO7TP8TwXt8A7GoilK9vxBLEw==
X-Gm-Gg: ASbGncuD+Fan1nejPVysmSJzChib5acxqWnVI7Y+BBoZDr/Cb8JRjlXCdLWQs/FuSG2
 T7FV0YaQj8cZ2FMM0T1nsu9DXeFE+UEiYYMaBK99b7IkN6/w5Q9gWth6o+a78
X-Received: by 2002:a05:600c:3508:b0:434:9936:c823 with SMTP id
 5b1f17b1804b1-43924994503mr60020075e9.18.1739014802674; 
 Sat, 08 Feb 2025 03:40:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFSEHpdn1iQEtAaZ19iiLEf/ZokcqJ/tMlEpRmFkQSZ4t2W3Mi7Ssw1i8k1FaDcg5mui26qNJ1gVzGD/B5mayk=
X-Received: by 2002:a05:600c:3508:b0:434:9936:c823 with SMTP id
 5b1f17b1804b1-43924994503mr60019925e9.18.1739014802374; Sat, 08 Feb 2025
 03:40:02 -0800 (PST)
MIME-Version: 1.0
References: <20250125125137.1223277-1-zhao1.liu@intel.com>
 <20250125125137.1223277-4-zhao1.liu@intel.com>
 <17907481-89d6-457c-bcd3-66a444b1325d@redhat.com> <Z6Wx/RGBIElMaeZy@intel.com>
 <Z6W56AH3J1qOx18m@intel.com>
 <CABgObfa+_VVQWvrGWf6fJjf39O0AkoNB5aoptDrhk7dDx_SNXQ@mail.gmail.com>
 <Z6c8qju9IJaKM6rK@intel.com>
In-Reply-To: <Z6c8qju9IJaKM6rK@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sat, 8 Feb 2025 12:39:52 +0100
X-Gm-Features: AWEUYZmH99vpotQ0rtrXqSyInMaku2dIohEqkNdsQBDDZH7DrbhDDmAE4Gy9QpQ
Message-ID: <CABgObfYJK_LsG6DwALpym1ZHk1TUA9G0Wa2JAit3yULeWkAgSA@mail.gmail.com>
Subject: Re: [PATCH 03/10] rust/irq: Add a helper to convert [InterruptSource]
 to [*mut IRQState]
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Junjie Mao <junjie.mao@hotmail.com>, 
 =?UTF-8?Q?Alex_Benn=EF=BF=BDe?= <alex.bennee@linaro.org>, 
 =?UTF-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVk77+9?= <philmd@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?B?RGFuaWVsIFAgLiBCZXJyYW5n77+9?= <berrange@redhat.com>, 
 qemu-devel <qemu-devel@nongnu.org>, qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PWOqDtf74KGnVaeTUI8Rf7dWvjaiBpatS5UytzI6Ftk_1739014803
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000008e1d04062d9fefc8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 08 Feb 2025 11:40:13 -0000

--0000000000008e1d04062d9fefc8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il sab 8 feb 2025, 11:55 Zhao Liu <zhao1.liu@intel.com> ha scritto:

> On Fri, Feb 07, 2025 at 10:57:11AM +0100, Paolo Bonzini wrote:
> > Date: Fri, 7 Feb 2025 10:57:11 +0100
> > From: Paolo Bonzini <pbonzini@redhat.com>
> > Subject: Re: [PATCH 03/10] rust/irq: Add a helper to convert
> >  [InterruptSource] to [*mut IRQState]
> >
> > Il ven 7 feb 2025, 08:25 Zhao Liu <zhao1.liu@intel.com> ha scritto:
> >
> > > Just to confirm, I check with `cargo +nightly clippy` but it doesn't
> > > complain about this case. Should I switch to another version of clipp=
y
> > > when I do such check? (currently I'm using v0.1.63 clippy as well, to
> > > match rustc.)
> > >
> >
> > I don't remember exactly how I noticed it=E2=80=94I am pretty sure it b=
roke in CI
> > though. Maybe the change to add rust_version hid it.
> >
> > To answer your question, generally the idea is that we use the latest
> > version of the developer tools (cargo, rustfmt, clippy). In particular
> old
> > versions of cargo don't support retrieving clippy settings from
> Cargo.toml.
>
> This one inspired me. I'm thinking that even though we deleted the
> README of pl011, a gneral guide or doc section (at somewhere, e.g.,
> docs/devel/style.rst or docs/devel/submitting-a-patch.rst) would be
> helpful.
>
> At least, that could remind contributor to check patches with latest
> toolchain instead of letting the maintainer's CI smoking fail.
>

I have sent a docs/devel/rust.rst sometime last week, it will be in the
next pull request and then you can send a patch on top.

Paolo

Thanks,
> Zhao
>
>

--0000000000008e1d04062d9fefc8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">Il sab 8 feb 2025, 11:55 Zhao Li=
u &lt;<a href=3D"mailto:zhao1.liu@intel.com">zhao1.liu@intel.com</a>&gt; ha=
 scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri=
, Feb 07, 2025 at 10:57:11AM +0100, Paolo Bonzini wrote:<br>
&gt; Date: Fri, 7 Feb 2025 10:57:11 +0100<br>
&gt; From: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=
=3D"_blank" rel=3D"noreferrer">pbonzini@redhat.com</a>&gt;<br>
&gt; Subject: Re: [PATCH 03/10] rust/irq: Add a helper to convert<br>
&gt;=C2=A0 [InterruptSource] to [*mut IRQState]<br>
&gt; <br>
&gt; Il ven 7 feb 2025, 08:25 Zhao Liu &lt;<a href=3D"mailto:zhao1.liu@inte=
l.com" target=3D"_blank" rel=3D"noreferrer">zhao1.liu@intel.com</a>&gt; ha =
scritto:<br>
&gt; <br>
&gt; &gt; Just to confirm, I check with `cargo +nightly clippy` but it does=
n&#39;t<br>
&gt; &gt; complain about this case. Should I switch to another version of c=
lippy<br>
&gt; &gt; when I do such check? (currently I&#39;m using v0.1.63 clippy as =
well, to<br>
&gt; &gt; match rustc.)<br>
&gt; &gt;<br>
&gt; <br>
&gt; I don&#39;t remember exactly how I noticed it=E2=80=94I am pretty sure=
 it broke in CI<br>
&gt; though. Maybe the change to add rust_version hid it.<br>
&gt; <br>
&gt; To answer your question, generally the idea is that we use the latest<=
br>
&gt; version of the developer tools (cargo, rustfmt, clippy). In particular=
 old<br>
&gt; versions of cargo don&#39;t support retrieving clippy settings from Ca=
rgo.toml.<br>
<br>
This one inspired me. I&#39;m thinking that even though we deleted the<br>
README of pl011, a gneral guide or doc section (at somewhere, e.g.,<br>
docs/devel/style.rst or docs/devel/submitting-a-patch.rst) would be<br>
helpful.<br>
<br>
At least, that could remind contributor to check patches with latest<br>
toolchain instead of letting the maintainer&#39;s CI smoking fail.<br></blo=
ckquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">I have se=
nt a docs/devel/rust.rst sometime last week, it will be in the next pull re=
quest and then you can send a patch on top.</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">Paolo</div><div dir=3D"auto"><br></div><div dir=3D"auto=
"><div class=3D"gmail_quote gmail_quote_container"><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
Thanks,<br>
Zhao<br>
<br>
</blockquote></div></div></div>

--0000000000008e1d04062d9fefc8--


