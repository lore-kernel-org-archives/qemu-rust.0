Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tGDJG-0001Dr-FP
	for mharc-qemu-rust@gnu.org; Wed, 27 Nov 2024 03:22:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tGDJE-0001DT-Mf
 for qemu-rust@nongnu.org; Wed, 27 Nov 2024 03:22:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tGDJD-0007uP-22
 for qemu-rust@nongnu.org; Wed, 27 Nov 2024 03:22:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732695721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DP47wj4tJ8N3vH2MLwc3iQnimSIxAjB3vsTH8u30yb8=;
 b=Ko3RP9s+DAPy0IIjuj80UybhzLbc6ALC24GX2SnqsMsnaY9yqxUIzReeqDFW7EIq48MsOi
 58i5q20l2h82blFv7fSQ5lgDP8eVWuvoNA4Oxd2kjqSkder7GL5LtYsog8jFXVjBWRjhm5
 RBZsYMOZ8gjL/O62XWT27r1FFEtq+GE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-459--dSh3SyIPKaJWbGWIlaHQQ-1; Wed, 27 Nov 2024 03:21:58 -0500
X-MC-Unique: -dSh3SyIPKaJWbGWIlaHQQ-1
X-Mimecast-MFC-AGG-ID: -dSh3SyIPKaJWbGWIlaHQQ
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-38243a4ba5fso4533763f8f.2
 for <qemu-rust@nongnu.org>; Wed, 27 Nov 2024 00:21:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732695717; x=1733300517;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DP47wj4tJ8N3vH2MLwc3iQnimSIxAjB3vsTH8u30yb8=;
 b=EEHzuqK77p7p036yO66+GVl1LgAj3to8ChiX4V3JWbdtp25A14551O+o278P/4k63N
 HhudBnLAzrBq/bIrJZ+sz0AFVYI6lEVWBg9XOg7NcjXMjHJa7V3uoNZOw1qYZ1aoj5C1
 RlLpo8SvrfsMhcQ6sgIC7AXbUFfLmvJMGI9G3kB+GYoc04HttZedCg5hunAJwfpbDpfh
 2EDYpThnxUkCN+kDzoVoTEyKsBePZIF6KLmIsKY3xp7EVebhAYUHld/HPfF7j/KIL5Xg
 TI64hO9/8Jf/6lnPO8P3c9Gt6Ls2pTG8IQc2+BRxY7+9Zam0YZBb5Nf34dcQWxlWbyyz
 +QCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcbe0Lh5j90JaQM9ZtRmkGk806YMn0ralDOe7IYFNBHGW11Ntp4PGvkHbmnJx4qTwmLq/9AXUjWhs=@nongnu.org
X-Gm-Message-State: AOJu0YxEs06wvgVxl0G3UWRP2+vvIGW8qjUwbkrZknd4R3H5E6euiEq8
 DCxNqZPq7ofx+etQQXtI2peEIQTLgr8WVql70WFDG0VyF605ddugMRE7Aar0L07SQyDA7U9x7zf
 VSmuFNKbxCdhSMIeEgWRrRBzTn1dN8BOgOsPjmUlAkc7CBKYe5ynarDq4wCGL4fwcQUpl01N5Ma
 kQk1MhvRpCtfAAo1AJ+kpa6XxNfA==
X-Gm-Gg: ASbGncsrqmZj3jF7xoV+4UcneYqRRvPKoZGN9rje6GffYw5jXWmCTLUJUI19pHA56Mg
 RNXMIFIcHIjsgC2LXA6X4YKuDKc3TfkmS
X-Received: by 2002:a05:6000:1449:b0:382:4b9a:f506 with SMTP id
 ffacd0b85a97d-385c6ed95e6mr1939805f8f.36.1732695717136; 
 Wed, 27 Nov 2024 00:21:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFCotwVjRpTeqkFRlC8nWWIYnrsnmeT11idGx3EdgiSKEGSdqqT5Q7gcR2sLcNNg8jeBUgW0Dy+AXPE7QuGI6k=
X-Received: by 2002:a05:6000:1449:b0:382:4b9a:f506 with SMTP id
 ffacd0b85a97d-385c6ed95e6mr1939786f8f.36.1732695716868; Wed, 27 Nov 2024
 00:21:56 -0800 (PST)
MIME-Version: 1.0
References: <cc40943e-dec1-4890-a1d9-579350ce296f@pbonzini.local>
 <Z0bAPQxjwyc15Hyv@intel.com>
In-Reply-To: <Z0bAPQxjwyc15Hyv@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 27 Nov 2024 09:21:45 +0100
Message-ID: <CABgObfYY1PrD9dRKRgzgyRAe8gzp-4KHvV1-Bgq32_2jpaTMPg@mail.gmail.com>
Subject: Re: Rust in QEMU roadmap
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _wu-rCHuuSSSe93gDCULE4f14K1bsR5smwuxyGPNfR8_1732695717
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000b54b990627e0a83e"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.931,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-List-Received-Date: Wed, 27 Nov 2024 08:22:05 -0000

--000000000000b54b990627e0a83e
Content-Type: text/plain; charset="UTF-8"

Il mer 27 nov 2024, 07:28 Zhao Liu <zhao1.liu@intel.com> ha scritto:

> Hi Paolo, thanks for your sharing and summary, do you have the plan
> about custom allocator (QemuAllocator in rust/qemu-api/src/lib.rs)?
>

No plan yet, but we'll see once we introduce C data structures allocated
from Rust. Adding the libc crate to the build is not hard and it may be
simpler than enabling the QemuAllocator.

Paolo


Regards,
> Zhao
>
>

--000000000000b54b990627e0a83e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il mer 27 nov 2024, 07:28 Zhao Liu &lt;<a href=3D"mail=
to:zhao1.liu@intel.com">zhao1.liu@intel.com</a>&gt; ha scritto:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">Hi Paolo, thanks for your s=
haring and summary, do you have the plan<br>
about custom allocator (QemuAllocator in rust/qemu-api/src/<a href=3D"http:=
//lib.rs" rel=3D"noreferrer noreferrer" target=3D"_blank">lib.rs</a>)?<br><=
/blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">No pl=
an yet, but we&#39;ll see once we introduce C data structures allocated fro=
m Rust. Adding the libc crate to the build is not hard and it may be simple=
r than enabling the QemuAllocator.</div><div dir=3D"auto"><br></div><div di=
r=3D"auto">Paolo</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
Regards,<br>
Zhao<br>
<br>
</blockquote></div></div></div>

--000000000000b54b990627e0a83e--


