Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uHjrd-00071d-8k
	for mharc-qemu-rust@gnu.org; Wed, 21 May 2025 09:52:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uHjrE-0006zD-90
 for qemu-rust@nongnu.org; Wed, 21 May 2025 09:51:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uHjrA-0006at-0P
 for qemu-rust@nongnu.org; Wed, 21 May 2025 09:51:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747835497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TLAbJwWk+zXlTB1vrvkrehkS1xSOSoMPDH3c1wuQcsQ=;
 b=Jb3Pd+quecc2CuG2LCB9kuJKfFOqqwMmOd/jaa44RHtXj+6gt9JKmtCwsKMI7g+LN+IMo6
 6OT8MYI+0Fy1rV9xLYLiglNsUnrZv1fgrtp4kx3Gle3Tq7Dd84ckLbfMb4HdXfvyfgy6fZ
 eHTrgzQQ6LdAWQnsL8IXJtkQmulM0CQ=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-d03XuSvyNLmf0uYBsEWsyg-1; Wed, 21 May 2025 09:51:36 -0400
X-MC-Unique: d03XuSvyNLmf0uYBsEWsyg-1
X-Mimecast-MFC-AGG-ID: d03XuSvyNLmf0uYBsEWsyg_1747835495
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-3280cd9fe4cso13746831fa.2
 for <qemu-rust@nongnu.org>; Wed, 21 May 2025 06:51:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747835493; x=1748440293;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TLAbJwWk+zXlTB1vrvkrehkS1xSOSoMPDH3c1wuQcsQ=;
 b=d8/diEfb53lJIQG58MTO8FuPGmPRdcICwVpbSuKCrOc/5wER+ItmTv2i6q4LEonmHi
 5FMbEM0H+yhLUQvAe9Xl4OfVipjfB6K+AjEvTNdrNn/K1yElvxQR+uYQTO219BwKxPaB
 SZNFHJ6NXJJBlxPps1YvZd1TrNhwV1lXiWB3mMyhX/yAHwQkxAdEVdtY95Y7+PBFgk34
 kDFUtZS2GlattRwZ76IN9PKgUEXxK9PApaTADrCouxeLZAK9z7vNJWxdyTb4Js5V7bTG
 si4ZmD5pVkYjFtrp2jmvr2GmTwpnSmVub8qlIIlEEUQfaHoEiHfQXGVhzn58GrbLFaZX
 /vWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsaxI6s9+yA2jSCeXzfM/iBomJLqCmj1q81QOfLQoa7AkKJxoiFBgaq/xOvKMi0s93ntiSC99TJKU=@nongnu.org
X-Gm-Message-State: AOJu0YxLI90lPca15TgihYlyDyx/kkrZPKx8HlCZjQMhy9zuDO13nFgZ
 G7hG2rJZ4CRWnZHpbsod66tPnbT1BxX/IqpEdqHWmqk8fyb85vP2MBYrSd5dtx+0qGrSk2zLB3D
 hkR0l5CKL9h0K8wznLQBSf7OvwXZBEQjQxL7/bnKDszyDBIp/qoj/xZediVU5+fmdJGvWYZCKzt
 HIS/gefvxCpb3u2Btivdwzyusg/N8SqNi9PQU6eg==
X-Gm-Gg: ASbGncsF9vzyxmVol7VWE9U5P2e3SH88/u/NIxzITPAXY6GFHzIbykHx3200Fomib1t
 6Q57FtiitQdx4lcwgxBuBWCSt56uJtTCB/IeCaAyF/h9yVGJOV9K6P0r/E+ft6lecLIU=
X-Received: by 2002:a2e:ae0e:0:b0:30b:cd41:89c7 with SMTP id
 38308e7fff4ca-32807736531mr65648351fa.22.1747835493232; 
 Wed, 21 May 2025 06:51:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGS+CHiLnn3WLec1hDg1Mr4Hq7/8xJ/Vo7edMZtdaoLZVdggk+3kNFQOfoTpnWawi7JaurliNdok8fshU7BKWk=
X-Received: by 2002:a05:6000:2385:b0:3a3:4ba4:f3cd with SMTP id
 ffacd0b85a97d-3a35c821e38mr16589443f8f.1.1747835482114; Wed, 21 May 2025
 06:51:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250521081845.496442-1-pbonzini@redhat.com>
 <20250521081845.496442-6-pbonzini@redhat.com>
 <CAAjaMXaeM0Nt3dzEJLCiAOeCQzneEDO6yeX3+CF5tZ2dhQ=YLw@mail.gmail.com>
In-Reply-To: <CAAjaMXaeM0Nt3dzEJLCiAOeCQzneEDO6yeX3+CF5tZ2dhQ=YLw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 21 May 2025 15:51:09 +0200
X-Gm-Features: AX0GCFskEqIBfZzMwAaokzgt7MsktJWVY2naGoodt-FOhBPgcV6fQiBNnrq30nw
Message-ID: <CABgObfbaTced6eqXW_h+Nkth9i0gB_myrtpG64a46K0MQgFRzQ@mail.gmail.com>
Subject: Re: [RFC PATCH 5/6] rust: pl011: switch from bilge to bitfield-struct
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Maydell,
 Peter" <peter.maydell@linaro.org>, qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: upQjiSQ5OEiifzJ4k6eP0Fcwh1cd2H7pbsOmDb01rDs_1747835495
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000099bb10635a5a9a5"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.184,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 21 May 2025 13:51:46 -0000

--000000000000099bb10635a5a9a5
Content-Type: text/plain; charset="UTF-8"

Il mer 21 mag 2025, 11:22 Manos Pitsidianakis <
manos.pitsidianakis@linaro.org> ha scritto:

> Perhaps it'd be simpler to contribute const-ability to upstream bilge?
> Is From/Into the only problem trait?


Probably.

I was thinking we can generate
> from/into associated methods for each type that are const


Yes, that's what bitfield-struct does too.

. It'd not
> even be a big change and we can carry it as a patch until we can
> catchup with upstream crates.io version in subprojects/. WDYT?
>

Sure, I have no idea how hard it is but I think they'd accept it? The
bitflags/bits part is more important; I put the two together just for
convenience, as a "let's define our standard toolbox" kind of series,
because they conflict. But it's possible to merge just the first part.

Paolo


> --
> Manos Pitsidianakis
> Emulation and Virtualization Engineer at Linaro Ltd
>
>

--000000000000099bb10635a5a9a5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il mer 21 mag 2025, 11:22 Manos Pitsidianakis &lt;<a h=
ref=3D"mailto:manos.pitsidianakis@linaro.org" target=3D"_blank" rel=3D"nore=
ferrer">manos.pitsidianakis@linaro.org</a>&gt; ha scritto:</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
Perhaps it&#39;d be simpler to contribute const-ability to upstream bilge?<=
br>
Is From/Into the only problem trait?</blockquote></div></div><div dir=3D"au=
to"><br></div><div dir=3D"auto">Probably.</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"> I was thinking we can generate<br>
from/into associated methods for each type that are const</blockquote></div=
></div><div dir=3D"auto"><br></div><div dir=3D"auto">Yes, that&#39;s what b=
itfield-struct does too.</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">. It&#39;d not<br>
even be a big change and we can carry it as a patch until we can<br>
catchup with upstream <a href=3D"http://crates.io" rel=3D"noreferrer norefe=
rrer noreferrer" target=3D"_blank">crates.io</a> version in subprojects/. W=
DYT?<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"au=
to">Sure, I have no idea how hard it is but I think they&#39;d accept it? T=
he bitflags/bits part is more important; I put the two together just for co=
nvenience, as a &quot;let&#39;s define our standard toolbox&quot; kind of s=
eries, because they conflict. But it&#39;s possible to merge just the first=
 part.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
<br>
-- <br>
Manos Pitsidianakis<br>
Emulation and Virtualization Engineer at Linaro Ltd<br>
<br>
</blockquote></div></div></div>

--000000000000099bb10635a5a9a5--


