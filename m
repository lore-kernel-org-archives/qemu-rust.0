Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tadvE-0002Vs-NU
	for mharc-qemu-rust@gnu.org; Wed, 22 Jan 2025 11:49:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tadvC-0002V1-0v
 for qemu-rust@nongnu.org; Wed, 22 Jan 2025 11:49:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tadvA-0005Cv-62
 for qemu-rust@nongnu.org; Wed, 22 Jan 2025 11:49:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737564577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ewwt2ACOxa4uDhbRVGHGO38ZWqXmpYtep152cfUhE7o=;
 b=XBv+6di1J1CUFyDsLuEr2KQOs4qKVdS1ftii7qEN5HAOi6Iu3iK7GUjFKmEcXveVtb89dV
 v5LcXHDzUkT/1qIxJKZjn51ud+YfHXYOT4zIzei33zUbJgUg0E8W49O6iqrPoTd5ME2wwn
 vdix8rf0LtXSdI5SveFVuuDx+LyTWQs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-281-sUZgd6NxMQ22OecTlMulwA-1; Wed, 22 Jan 2025 11:49:36 -0500
X-MC-Unique: sUZgd6NxMQ22OecTlMulwA-1
X-Mimecast-MFC-AGG-ID: sUZgd6NxMQ22OecTlMulwA
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-38bf4913669so2959561f8f.2
 for <qemu-rust@nongnu.org>; Wed, 22 Jan 2025 08:49:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737564574; x=1738169374;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ewwt2ACOxa4uDhbRVGHGO38ZWqXmpYtep152cfUhE7o=;
 b=O+LyGQMjJA4GYNOw9HaQw/j87N/vcPijoi60DFYCcTyqLvSYWKr9C1pphJ00yEtlv0
 2J4njuqhZp1hWKyqWwe9YmMau5WEOORerm+TvCcGYvNyNLOXkcn9g1aexH2NUhCYnnLX
 8p7jDgkXcuXWSr2qQzsH0vmQneBBrag3YV1r+Q7rywz09I4aFZ6cCV3a8uZfE1njEANg
 d0zNoOGB3h0Ce3FrIypoC0kZLkjpFE8jTroWzIT+s1GaVn4hg00/JnvzAbYlcuZKIGhI
 BBvbCOlOPr59f8imUrDZOB/3+a+OxDY1YlEH+E9x+ssb2OittqQPqtWpuJZ8z7y9BaVu
 dLsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYhrPVdv7QFMRhh0GU+XtRmwz3qHOmEMS2KdhCiZatB++jaen2NW8lIzjOkWGWblzbDDZapLbtWe8=@nongnu.org
X-Gm-Message-State: AOJu0Yy7FtT7IJ60vcnKvDRhkHZhbHfMbByZ1Mr9WEiU1VRltG0BYopv
 uR56pkzO4DFuBvdTF5WLa2xh6nsXTEksn1cLIBfXU7qyBGd6V7kfEKor7AvilyK1CVRhbUNToMy
 xVlgdzCpQbUkMG7dbc9OTX+V06/KiLUHz7+j0W5T94Srz5iCWXN6ZV9U8UjdbdE6RkZ1Ie7So2N
 0AIwQtJf1iHFI59Az4A2h5JEZ/WvM3vYgIUNge
X-Gm-Gg: ASbGncsudTA3FwPm1WrSiYxEyIFPSSgjbuu+946KM5uma+rj5wT4/BZTMI6ObEIVpWQ
 hgBwRRYFHsKgx1Z08ENUx9uAPHCwJ5S9mDWfowtSy/lwvD10bd2lF
X-Received: by 2002:a5d:6c68:0:b0:385:ef39:6cd5 with SMTP id
 ffacd0b85a97d-38bf5656ddfmr20447882f8f.1.1737564574699; 
 Wed, 22 Jan 2025 08:49:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFIlUdFElqPlZD3AMZVNXG5fTQ1sRYntTeK5AVMOO8Y1xb54ZQPiE0GPkMoE9XMhk5DK8ZUZE/2ZzFpUrUaz5c=
X-Received: by 2002:a5d:6c68:0:b0:385:ef39:6cd5 with SMTP id
 ffacd0b85a97d-38bf5656ddfmr20447864f8f.1.1737564574415; Wed, 22 Jan 2025
 08:49:34 -0800 (PST)
MIME-Version: 1.0
References: <20250117092657.1051233-1-pbonzini@redhat.com>
 <20250117092657.1051233-6-pbonzini@redhat.com>
 <Z5Eh4Yj2Mp+xQV5Z@intel.com>
In-Reply-To: <Z5Eh4Yj2Mp+xQV5Z@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 22 Jan 2025 17:49:23 +0100
X-Gm-Features: AWEUYZlBceISABhncib1v-cMxvi0U0RBkasFmvdpWFE-I2wJRl98yh0eb_vTwMg
Message-ID: <CABgObfYf4ZmFANOVja=DGVzhn9rKR6yT7tt_e6DqKTtOb5DiDQ@mail.gmail.com>
Subject: Re: [PATCH 05/10] rust: pl011: pull interrupt updates out of
 read/write ops
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: U-cWlmCxWEzP5QZtQ_mvqJDhlpl-IFFiDw8RRv0iUuM_1737564575
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000003b9fba062c4e471c"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
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
X-List-Received-Date: Wed, 22 Jan 2025 16:49:42 -0000

--0000000000003b9fba062c4e471c
Content-Type: text/plain; charset="UTF-8"

Il mer 22 gen 2025, 17:31 Zhao Liu <zhao1.liu@intel.com> ha scritto:

> >          if event == bindings::QEMUChrEvent::CHR_EVENT_BREAK &&
> !self.loopback_enabled() {
> > -            self.put_fifo(registers::Data::BREAK.into());
> > +            let update = self.put_fifo(registers::Data::BREAK.into());
>
> We can omit this `update` variable.
>

Indeed, but sometimes I left it because of long lines or to clarify the
meaning of the "bool" (or both).

Paolo

Reviewed-by: Zhao Liu <zhao.liu@intel.com>

--0000000000003b9fba062c4e471c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il mer 22 gen 2025, 17:31 Zhao Liu &lt;<a href=3D"mail=
to:zhao1.liu@intel.com" target=3D"_blank" rel=3D"noreferrer">zhao1.liu@inte=
l.com</a>&gt; ha scritto:</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if event =3D=3D bindings::QEMUChrEve=
nt::CHR_EVENT_BREAK &amp;&amp; !self.loopback_enabled() {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.put_fifo(registers::Da=
ta::BREAK.into());<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 let update =3D self.put_fif=
o(registers::Data::BREAK.into());<br>
<br>
We can omit this `update` variable.<br></blockquote></div></div><div dir=3D=
"auto"><br></div><div dir=3D"auto">Indeed, but sometimes I left it because =
of long lines or to clarify the meaning of the &quot;bool&quot; (or both).<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">Reviewed-by: Zhao Liu &lt;<a href=3D"mai=
lto:zhao.liu@intel.com" rel=3D"noreferrer noreferrer" target=3D"_blank">zha=
o.liu@intel.com</a>&gt;</blockquote></div></div></div>

--0000000000003b9fba062c4e471c--


