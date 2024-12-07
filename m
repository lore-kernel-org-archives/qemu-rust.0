Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tK0jw-0002v2-Mf
	for mharc-qemu-rust@gnu.org; Sat, 07 Dec 2024 14:45:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tK0jv-0002uZ-EP
 for qemu-rust@nongnu.org; Sat, 07 Dec 2024 14:45:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tK0jt-0001Fj-6Q
 for qemu-rust@nongnu.org; Sat, 07 Dec 2024 14:45:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733600714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rfviz3+RJEQHLnq1F5+iSVV04mCXVnj5nH43drfDTXU=;
 b=H9n0rW3qyTP7fSk29yTLm7dWJPII5ZLDHlo0EZPJG0rZosDo2pIvRQ1sq0uPv4KxyQ+W8f
 tlEZU0ZKQycycbubA+6pggEAtlhL13DpTeKMwpBZr0b/CL/j5AJuKxqjsHW0SBvYhohYPC
 R1nDmeKj7KtaGTecwiynqDveiG/8lHE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-478-jXHXgVzQNGeLn6P6rXTQrQ-1; Sat, 07 Dec 2024 14:45:10 -0500
X-MC-Unique: jXHXgVzQNGeLn6P6rXTQrQ-1
X-Mimecast-MFC-AGG-ID: jXHXgVzQNGeLn6P6rXTQrQ
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-385e9c69929so444219f8f.1
 for <qemu-rust@nongnu.org>; Sat, 07 Dec 2024 11:45:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733600709; x=1734205509;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Rfviz3+RJEQHLnq1F5+iSVV04mCXVnj5nH43drfDTXU=;
 b=YkioN8C6ymndyYpZC2wTyBSoHu+ECgqN2Nax/G2YdsiarmA+FGI6FgQgQpf853Wrbh
 dIF7NoX5cZaCVOxRwZTUn4Lk4mjjhR3rZ3kxp1+v0ZEAqnwyu8Wu/I4/QglwxqAZ2PJY
 IU3IquQECHR5AZSG9RLwV5UcW0M7TAa8rHdeE3Rg1Wyd40ZBR29YeBn7IPUz06OAAMhZ
 S2RCl9AeUhlcCVtRgHRwF5T9MAo+TJF18Lqj8HVdFzgIbnK24F7bYdMT4vNHXLQzAhiF
 QaG782jh2sFfSfl2KXLRQxgB11JW+HL3KXl5qCyQZ60D0FyBTawc3V9FQsbUFQ3DeZlA
 wG8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmJs+2frZ5F0OhdxnIfyvQ8rm8W1pZmX3AfAslulGqV8KvvfTNCHbd/UHaVp7/quSVvNbSGt1I7sc=@nongnu.org
X-Gm-Message-State: AOJu0YyrAeIC6RutJqcObQjSZGvwxd8pZLaczUtf0TNh719kcSexlS7t
 x8gaqixgk7GWRk6dl4S153bHmVmpj1xfMzbBBJd1LagsuuOvkclXaeH7mPG/pZBDKLzIIhRajxD
 tfaBVgOhq0357XC4WWfxEY2tPz+3oM+yqMwLi/6dJOeZGHFBjoNTe4Ss7LIJW4epgWNsug4eo4I
 yLRWUDsF+rmBITvg9eqWFiAYvx1A==
X-Gm-Gg: ASbGncuUoGHOKHjowyEw39tQvYr8nRsJYlZmPWvjuTJMD/7z9ouv1FtpumLy39wCYoR
 d23wm5LpvzyXXf5fBsZDOy3MQoBeudQ==
X-Received: by 2002:adf:e18a:0:b0:385:e2c4:1f8d with SMTP id
 ffacd0b85a97d-3862b351423mr5746196f8f.19.1733600709418; 
 Sat, 07 Dec 2024 11:45:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGLSoa7HdOTdDeZ7TEqhhzoulQMze8aNsJmQnv3X/qUJNM69D+7IluIXSjemAOV0v0Fbx0JVjpt6YBcItvXb5k=
X-Received: by 2002:adf:e18a:0:b0:385:e2c4:1f8d with SMTP id
 ffacd0b85a97d-3862b351423mr5746182f8f.19.1733600709112; Sat, 07 Dec 2024
 11:45:09 -0800 (PST)
MIME-Version: 1.0
References: <20241205060714.256270-1-zhao1.liu@intel.com>
 <20241205060714.256270-6-zhao1.liu@intel.com>
 <adb80a8c-ee40-4d8e-898b-a62d12746aa9@redhat.com> <Z1RxQU7sgxi2WJxQ@intel.com>
In-Reply-To: <Z1RxQU7sgxi2WJxQ@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sat, 7 Dec 2024 20:44:58 +0100
Message-ID: <CABgObfZpn4R2dpEJQr2-60QXEyBfLnY6ztdWG1Bd5NW0VN3TNQ@mail.gmail.com>
Subject: Re: [RFC 05/13] rust: add a bit operation binding for deposit64
To: Zhao Liu <zhao1.liu@intel.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, 
 Junjie Mao <junjie.mao@hotmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel <qemu-devel@nongnu.org>,
 qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cp4swtYH5GTK7-S-Z2HtDQaH-HX5-QMI1J5yIFQhC_g_1733600709
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000007314540628b35e63"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Sat, 07 Dec 2024 19:45:19 -0000

--0000000000007314540628b35e63
Content-Type: text/plain; charset="UTF-8"

Il sab 7 dic 2024, 16:43 Zhao Liu <zhao1.liu@intel.com> ha scritto:

> > impl IntegerExt for u64
> > {
> >     fn deposit(self, start: usize, length: usize, fieldval: u64) -> u64 {
> >         /* FIXME: Implement a more elegant check with error handling
> support? */
> >         assert!(length > 0 && length <= 64 - start);
> >
> >         let mask = (u64::MAX >> (64 - length)) << start;
> >         (value & !mask) | ((fieldval << start) & mask)
> >     }
> > }
>
> Then C and Rust would be using completely different bitops library, is
> it necessary to implement the C interface directly in Rust instead of
> keeping the C implementation (when Rust is enabled)?
>

If it's domain specific (related to emulation) then it's better to avoid
duplication but In some cases it's unavoidable: for example very very
simple inlines (e.g. clock_get_hz for an example) or simple forwarding APIs
like the various timer_init variants. It's simpler to redo the forwarding
in Rust and only write the callback translation once, than to repeat many
times the code to translate the callbacks and forward each init variant to
the corresponding C function.

Paolo

> And we can add a "prelude" module so that you can do
> >
> > use qemu_api::prelude::*;
> >
> > and get all these useful traits at once.  I will send a patch after
> > fleshing the idea out a bit more.
>
> Thanks! Cross fingers.
>
> Regards,
> Zhao
>
>
>

--0000000000007314540628b35e63
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il sab 7 dic 2024, 16:43 Zhao Liu &lt;<a href=3D"mailt=
o:zhao1.liu@intel.com">zhao1.liu@intel.com</a>&gt; ha scritto:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">&gt; impl IntegerExt for u64=
<br>
&gt; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0fn deposit(self, start: usize, length: usize, field=
val: u64) -&gt; u64 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* FIXME: Implement a more elegant ch=
eck with error handling support? */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert!(length &gt; 0 &amp;&amp; leng=
th &lt;=3D 64 - start);<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0let mask =3D (u64::MAX &gt;&gt; (64 -=
 length)) &lt;&lt; start;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(value &amp; !mask) | ((fieldval &lt;=
&lt; start) &amp; mask)<br>
&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt; }<br>
<br>
Then C and Rust would be using completely different bitops library, is<br>
it necessary to implement the C interface directly in Rust instead of<br>
keeping the C implementation (when Rust is enabled)?<br></blockquote></div>=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">If it&#39;s domain spec=
ific (related to emulation) then it&#39;s better to avoid duplication but I=
n some cases it&#39;s unavoidable: for example very very simple inlines (e.=
g. clock_get_hz for an example) or simple forwarding APIs like the various =
timer_init variants. It&#39;s simpler to redo the forwarding in Rust and on=
ly write the callback translation once, than to repeat many times the code =
to translate the callbacks and forward each init variant to the correspondi=
ng C function.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</di=
v><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote">=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; And we can add a &quot;prelude&quot; module so that you can do<br>
&gt; <br>
&gt; use qemu_api::prelude::*;<br>
&gt; <br>
&gt; and get all these useful traits at once.=C2=A0 I will send a patch aft=
er<br>
&gt; fleshing the idea out a bit more.<br>
<br>
Thanks! Cross fingers.<br>
<br>
Regards,<br>
Zhao<br>
<br>
<br>
</blockquote></div></div></div>

--0000000000007314540628b35e63--


