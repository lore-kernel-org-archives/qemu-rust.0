Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tfxXX-0007SB-P7
	for mharc-qemu-rust@gnu.org; Thu, 06 Feb 2025 03:47:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tfxXW-0007Rn-4S
 for qemu-rust@nongnu.org; Thu, 06 Feb 2025 03:47:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tfxXT-0001BL-GN
 for qemu-rust@nongnu.org; Thu, 06 Feb 2025 03:47:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738831629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EcWn8gSOffuGG6xc/qk0gAVlgO1wnVL90OnmFr38kqo=;
 b=LcYRkOPir4VjoRtm20ed3OzvnDTqk02aIhTkDZYqx4hakE60bfKqTyJkUqtLhML8SuYryh
 LqWCu7+yLuUKQ2R5nf7eVB7+5890t/6CG9sWXFvh521zfKLWQVyLi8sY82LIdGTD0nUQkE
 2VFQ++PljcN9UaTlqnnbvQyFNklyJmc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-330-Lm_fr2y7NqCF0qy_LNDFFg-1; Thu, 06 Feb 2025 03:47:08 -0500
X-MC-Unique: Lm_fr2y7NqCF0qy_LNDFFg-1
X-Mimecast-MFC-AGG-ID: Lm_fr2y7NqCF0qy_LNDFFg
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-38dafe1699cso356954f8f.3
 for <qemu-rust@nongnu.org>; Thu, 06 Feb 2025 00:47:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738831627; x=1739436427;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EcWn8gSOffuGG6xc/qk0gAVlgO1wnVL90OnmFr38kqo=;
 b=qvzuLhzX/UhFEYFFagw03Fe0jhwCgIzEDMCsQYFkzS6kTNAVQM/yc4qmJD+kUSn5A9
 wzfeX/bC77oSF36+9DBtlcetGYqhX4E4VcrCzn1l2aF1LSVq1OPUbYCKJjzKqU1dJaVG
 1+8WYVxPTSJPr0c/pkQlG0RTSQNenTXbtYW1RFd5SvAaEmUXMSCsk1o3JuA19+wGNuBk
 VyBGBvQImQLUic57pHKjbXBbthbmAdwvRAck3pYoP5skksI6q7a+Oe2Q/XhF23oUYCre
 CqhA9o6zbyFKLXyXPiONTf1K3tnbwFAlwkrN2jalN5bPSCjbRC2ghME7m0azf2RWwyaQ
 YYLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXshk6x9VTakWSuZ3j5SenlA6oBzOeZvPH8FK0OtAfPVH0ToxThnPZHBICXDp8vnJCSrhJjBiwvRCI=@nongnu.org
X-Gm-Message-State: AOJu0Yx+KhnORQ+WxnwDoXoR7PnDqtv4ZaWIusOlYx7KE4rOAbveT/id
 hfWxb+EGYMPgJRS50yt3maYkzxXQ4aZoBeJHPt5NYeF2/oQwXsxTKR5Wu8pHeiEGOGmd69AGOOO
 KupJ0t0rVbSdBTIv46kY3JftmPmUkhds1f8Qg0sG5KR6/zIdEtK8CCj8cJcPhPzE/8I+WFNjS/6
 q8Wvmnd2/pZKa4VQciEiF2YKkebIw+wNTlYeNNQcs=
X-Gm-Gg: ASbGncvRAUQdTylLGYjJUXkHLGzABchxkanwMuw+kEtliipza/SrcHozbZSbwKIpxQH
 XBAfqh15WlJkb8ebseMwfEVShZ5ShwfJQO9JzPv6QMfCru3DdrwtM+zGFWm8s
X-Received: by 2002:adf:ef89:0:b0:38d:a883:b95b with SMTP id
 ffacd0b85a97d-38db48a42f8mr5028506f8f.28.1738831626945; 
 Thu, 06 Feb 2025 00:47:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFlxdf4q9l9eLa8gvhUvQS1NxRxxKh+gU5zLlUtK7r/0iHxQr3yjDcucAXdBkr+sCnb84nyiLgU65nathbfMiA=
X-Received: by 2002:adf:ef89:0:b0:38d:a883:b95b with SMTP id
 ffacd0b85a97d-38db48a42f8mr5028479f8f.28.1738831626400; Thu, 06 Feb 2025
 00:47:06 -0800 (PST)
MIME-Version: 1.0
References: <20250117194003.1173231-1-pbonzini@redhat.com>
 <20250117194003.1173231-11-pbonzini@redhat.com>
 <7e35b5b6-01dd-457b-b36f-507a85300b45@linaro.org>
In-Reply-To: <7e35b5b6-01dd-457b-b36f-507a85300b45@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 6 Feb 2025 09:46:55 +0100
X-Gm-Features: AWEUYZlB2pxLs7Dq_G9DR4KiTmGwj1YsmeJEeWxJBc3ObuUMho9e6UPAfANYJU8
Message-ID: <CABgObfbr4yHBJxCVtOk9rQau3Z8M-QUy0+OqTnjecTsKTXrH0Q@mail.gmail.com>
Subject: Re: [PATCH 10/10] rust: bindings for MemoryRegionOps
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Xu1mvz99xz5R_Ph85VS7G8zKtnygQeAvtlq_gRnEUns_1738831627
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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
X-List-Received-Date: Thu, 06 Feb 2025 08:47:14 -0000

On Thu, Feb 6, 2025 at 9:40=E2=80=AFAM Philippe Mathieu-Daud=C3=A9 <philmd@=
linaro.org> wrote:
>
> Hi Paolo,
>
> On 17/1/25 20:40, Paolo Bonzini wrote:
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > ---
> >   rust/hw/char/pl011/src/device.rs     |  43 +++---
> >   rust/hw/char/pl011/src/lib.rs        |   1 -
> >   rust/hw/char/pl011/src/memory_ops.rs |  36 -----
> >   rust/qemu-api/meson.build            |   1 +
> >   rust/qemu-api/src/lib.rs             |   1 +
> >   rust/qemu-api/src/memory.rs          | 191 ++++++++++++++++++++++++++=
+
> >   rust/qemu-api/src/sysbus.rs          |   7 +-
> >   rust/qemu-api/src/zeroable.rs        |  12 ++
> >   8 files changed, 234 insertions(+), 58 deletions(-)
> >   delete mode 100644 rust/hw/char/pl011/src/memory_ops.rs
> >   create mode 100644 rust/qemu-api/src/memory.rs
> >
> > diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/=
device.rs
> > index 259efacb046..294394c6e82 100644
> > --- a/rust/hw/char/pl011/src/device.rs
> > +++ b/rust/hw/char/pl011/src/device.rs
> > @@ -2,7 +2,7 @@
> >   // Author(s): Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> >   // SPDX-License-Identifier: GPL-2.0-or-later
> >
> > -use core::ptr::{addr_of_mut, NonNull};
> > +use core::ptr::{addr_of, addr_of_mut, NonNull};
> >   use std::{
> >       ffi::CStr,
> >       os::raw::{c_int, c_void},
> > @@ -12,14 +12,14 @@
> >       bindings::{self, *},
> >       c_str, impl_vmstate_forward,
> >       irq::InterruptSource,
> > +    memory::{hwaddr, MemoryRegion, MemoryRegionOps, MemoryRegionOpsBui=
lder},
> >       prelude::*,
> > -    qdev::{Clock, ClockEvent, DeviceImpl, ResettablePhasesImpl, ResetT=
ype},
> > +    qdev::{Clock, ClockEvent, DeviceImpl, ResetType, ResettablePhasesI=
mpl},
> >       qom::{ClassInitImpl, ObjectImpl, Owned, ParentField},
> >   };
> >
> >   use crate::{
> >       device_class,
> > -    memory_ops::PL011_OPS,
> >       registers::{self, Interrupt},
> >       RegisterOffset,
> >   };
> > @@ -490,20 +490,24 @@ impl PL011State {
> >       /// location/instance. All its fields are expected to hold unitia=
lized
> >       /// values with the sole exception of `parent_obj`.
> >       unsafe fn init(&mut self) {
> > +        static PL011_OPS: MemoryRegionOps<PL011State> =3D MemoryRegion=
OpsBuilder::<PL011State>::new()
> > +            .read(&PL011State::read)
> > +            .write(&PL011State::write)
> > +            .native_endian()
>
> Could we always make .valid_sizes() explicit?

Yes (for example build() could even fail to compile if you don't have
impl_sizes/valid_sizes set), but why do you want that? I'm not even
sure that all cases of .valid.max_access_size=3D4 are correct...

Paolo


