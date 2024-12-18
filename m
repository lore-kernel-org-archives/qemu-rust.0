Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tNwUZ-0001pj-Cb
	for mharc-qemu-rust@gnu.org; Wed, 18 Dec 2024 11:01:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tNwUP-0001lA-Q3
 for qemu-rust@nongnu.org; Wed, 18 Dec 2024 11:01:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tNwUN-0008Fi-9W
 for qemu-rust@nongnu.org; Wed, 18 Dec 2024 11:01:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1734537690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s5EBVjzY+BbvqF9tO8LMu8C8as/z/S9MTTCoLGwires=;
 b=iFyvBbBGjzag+WvdFqmXv1Z6NvCm/5Mmui3YjcqtMkRRsFqkpTjMEl5k31r7YpR8ZWmJET
 k1ZFQcULmHPBWo6dnmXyUKN7Dvmwel9zopsJRKbGYlBfjwp8qwc+RvLH9KTlbuu8F/gtF/
 QznybxcO55LEoJf4Y0DWcuFY6p1BiXg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-136-g0zM6HB_Mo6UOCHSrAIOSg-1; Wed, 18 Dec 2024 11:01:27 -0500
X-MC-Unique: g0zM6HB_Mo6UOCHSrAIOSg-1
X-Mimecast-MFC-AGG-ID: g0zM6HB_Mo6UOCHSrAIOSg
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-38634103b0dso3660358f8f.2
 for <qemu-rust@nongnu.org>; Wed, 18 Dec 2024 08:01:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734537686; x=1735142486;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s5EBVjzY+BbvqF9tO8LMu8C8as/z/S9MTTCoLGwires=;
 b=jJBh9+TercCVZQd6viOhJwSViyfvFp7GrnfzJG/1TzEcvZXm6d6KT8AET/Zx8Zbw6R
 UJILvfJKjysE2X3POG5XqVq4Ar/E3ARUPHTgv1QVi/U+OEkXnVU5sABCcUe6lvVOygls
 fV9c6x3FUtkpT1bIrRoNYAsha46LiVxgGklqlCqUv7ET9Yi9CPs/IcVxuliKCR6wnyAx
 TD/+bdP3JilhXnsQEk/+msl2/oaenW/GqetILGNrWsay+lMVweVnhRxyr4FiZbjkREfx
 wTT2fsPxo9k9jjsIXwlnNRoL0Y7URCUrSL1a6rU/lYTJS+sQrv2F+V8qAg+/e+vndX8Q
 pXgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVVwAAZg16MKQ8bhh2cSh8TfVEYzp1K5QkRWeLoQk2J3sxfbb239fJHWSQPSK8+N+1kY8hNJk+rUM=@nongnu.org
X-Gm-Message-State: AOJu0YzSX4+LvPMOX8ygQdRBhRW9OZwUFtEZJGPbGKE1rpBJJ5ya3SDq
 CgtehCEAPGz9wg6RwZzluCmcgBkpelVvA8uDQQh/tAezzfUUUU+YbSDHeLntaxyLsX0vwSEq3dj
 MQBP/w3LOA3uSOMJaBcGLPs2iY+kt/VuABJa3aOsvEMvgI6gBj4kWw+fqyCELcDzc1cCpHhALkS
 1LmLzpXtg3LHHAUK6DrtDjSJLf8Q==
X-Gm-Gg: ASbGncvxvJKydjwqb1denpwa2Ps84hrfR0oCZKATiknodOnM9uERX4lN/rJvrxVd9kA
 HyN/fWX+/KZ+bDx7ZOTxjh/Rvg3O6TjGu+z1eyQ==
X-Received: by 2002:a5d:6d0a:0:b0:385:e8ce:7483 with SMTP id
 ffacd0b85a97d-388e4d2f4e5mr2597059f8f.4.1734537686340; 
 Wed, 18 Dec 2024 08:01:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGxPDuNT9R7ci8QVWtzOfIiKbpe4LatA8q39zVQTD0hSHV63I+9haxUDQrhYCCa6RhelisYwuE0Ffx6YZhbuC8=
X-Received: by 2002:a5d:6d0a:0:b0:385:e8ce:7483 with SMTP id
 ffacd0b85a97d-388e4d2f4e5mr2596963f8f.4.1734537685408; Wed, 18 Dec 2024
 08:01:25 -0800 (PST)
MIME-Version: 1.0
References: <20241209123717.99077-1-pbonzini@redhat.com>
 <20241209123717.99077-25-pbonzini@redhat.com>
 <Z2D2zk2Wdlqc5q2k@intel.com>
 <CABgObfY=jyu96eZ+ZcU9GXU+amt2wRm53vpvubHYTaeY9MWd2A@mail.gmail.com>
 <Z2JycooziPsfV8vX@intel.com>
 <CABgObfboJFTRMsuqO055g11ZWNx1qKNxrLgvYLc-Hh6RcmWtOw@mail.gmail.com>
 <d01798d5-1c93-48f7-bb78-d4602a13baac@redhat.com> <Z2LgScN1f/C3UdcD@intel.com>
In-Reply-To: <Z2LgScN1f/C3UdcD@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 18 Dec 2024 17:01:14 +0100
Message-ID: <CABgObfYqqkJeWRHt3Vrs=v0vTGo6Xh8kQk5KVgET_t=Vp0PEBQ@mail.gmail.com>
Subject: Re: [PATCH 24/26] rust: qom: move device_id to PL011 class side
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-rust@nongnu.org, 
 Junjie Mao <junjie.mao@hotmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1KnyEYuUKiFTAnt2wewQEHBXZaN0R-z7g49uPI9UzAk_1734537687
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000096bbd206298d8667"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1.116,
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
X-List-Received-Date: Wed, 18 Dec 2024 16:01:42 -0000

--00000000000096bbd206298d8667
Content-Type: text/plain; charset="UTF-8"

Il mer 18 dic 2024, 15:32 Zhao Liu <zhao1.liu@intel.com> ha scritto:

> On Wed, Dec 18, 2024 at 11:26:35AM +0100, Paolo Bonzini wrote:
> > Date: Wed, 18 Dec 2024 11:26:35 +0100
> > From: Paolo Bonzini <pbonzini@redhat.com>
> > Subject: Re: [PATCH 24/26] rust: qom: move device_id to PL011 class side
> >
> > On 12/18/24 08:14, Paolo Bonzini wrote:
> > >     Moving on to another topic, about the gap (or question :-)) where a
> > >     child class inherits the ClassInitImpl trait from the parent,
> please see
> > >     my test case example below: Doing something similar to
> SysBusDevice and
> > >     DeviceState using a generic T outside of the QOM library would
> violate
> > >     the orphan rule.
>
> BTW, maybe we could also squash my previous example in test? :-)
>

Sure.

Paolo

--00000000000096bbd206298d8667
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">Il mer 18 dic 2024, 15:32 Zhao L=
iu &lt;<a href=3D"mailto:zhao1.liu@intel.com">zhao1.liu@intel.com</a>&gt; h=
a scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On We=
d, Dec 18, 2024 at 11:26:35AM +0100, Paolo Bonzini wrote:<br>
&gt; Date: Wed, 18 Dec 2024 11:26:35 +0100<br>
&gt; From: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=
=3D"_blank" rel=3D"noreferrer">pbonzini@redhat.com</a>&gt;<br>
&gt; Subject: Re: [PATCH 24/26] rust: qom: move device_id to PL011 class si=
de<br>
&gt; <br>
&gt; On 12/18/24 08:14, Paolo Bonzini wrote:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Moving on to another topic, about the gap (or =
question :-)) where a<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0child class inherits the ClassInitImpl trait f=
rom the parent, please see<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0my test case example below: Doing something si=
milar to SysBusDevice and<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0DeviceState using a generic T outside of the Q=
OM library would violate<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0the orphan rule.<br>
<br>
BTW, maybe we could also squash my previous example in test? :-)<br></block=
quote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Sure.</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div></div>

--00000000000096bbd206298d8667--


