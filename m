Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tVClb-000390-KB
	for mharc-qemu-rust@gnu.org; Tue, 07 Jan 2025 11:49:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tVClb-00038k-3l
 for qemu-rust@nongnu.org; Tue, 07 Jan 2025 11:49:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tVClZ-0005OV-KF
 for qemu-rust@nongnu.org; Tue, 07 Jan 2025 11:49:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736268557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V8/csrjcE/UEWRc5Rp4XCkWcnSQqKk4EReSRr1S8hSc=;
 b=itgo01eQxInC0a/IIIUXT0NM6QwsZBYkOOsPmJbkEEbvUhkn+mt2IBw9V6gRqmnDkdAKRJ
 YTUJIv75He3uwuvet+nALDVdPwsq2pHCdIoxJVhUKwrSDW5ayaNYf0vAviOgPmzMzvVbhy
 JZuOBegzXr/Ma+dO7BL+oPa1GXITuZw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-481-u5vThn5_PMi4zH4P9RoWyw-1; Tue, 07 Jan 2025 11:49:15 -0500
X-MC-Unique: u5vThn5_PMi4zH4P9RoWyw-1
X-Mimecast-MFC-AGG-ID: u5vThn5_PMi4zH4P9RoWyw
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43621907030so121002215e9.1
 for <qemu-rust@nongnu.org>; Tue, 07 Jan 2025 08:49:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736268554; x=1736873354;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V8/csrjcE/UEWRc5Rp4XCkWcnSQqKk4EReSRr1S8hSc=;
 b=NkGFmoBxVKejTyDKyhDBexRUBkVwrhBYmHGZ4w5nPvgoU6B9dp48LE79CFqRMCQNA+
 jNhkqVDYOfeAnTzZPL2bgkZl7xIagZZOIelWpJ5UqE7bZjgNHgUlcqJD+x2yvWlPU9W1
 Y2BQMek44A3J5bR6FP3KGxSZZdDb3l9tsbKwAO7bmhu2WdE04QxnV/l705vgYQ+AeUlY
 3Jk3u8tu/smabCni8aftxa3z9fM6OJ9MunXNdItMCwo8EGKATl/OwkNTCv6b871BVI/3
 DiRlgjYE9Q9J95EBHD6wtAFqx1M5BVcILV9KF69/WTpiuQGXWvsMKdXwayEu4YhWaPBs
 fmsQ==
X-Gm-Message-State: AOJu0YwlDTy4PZSm2TQC+TP2O8lqL1ylhkLhi8MhtZJ/sCvtky7dgE4N
 e6pGn5axk3IU1QRPJbofbuxwIFiSIvcbVwLkg68gR3apIQT4qhpFyMcO0HaXIFwjskWlak4aaMq
 wmViqqzeVwV+QEub19ARaM1sledzK5u0l0HbzJXeMuPvKTC1yEJv94JoolWd6raEz7a99o9gctn
 JkN6m/elBJnXFKZf0v/cF0DzAl+/ve6tjexzT+
X-Gm-Gg: ASbGnctaAvMigBgPaE5TH+KlowkzSGb164Fh2fDmAtbJjky2vTjhDwfsaYNagzjP4Rb
 fRbyjeep7vFqlXYk4I+QeWEacXvgVffFBMUQIRw==
X-Received: by 2002:a05:6000:1568:b0:385:dc45:ea22 with SMTP id
 ffacd0b85a97d-38a223f835dmr50147126f8f.39.1736268553781; 
 Tue, 07 Jan 2025 08:49:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFImnDvUOrUVwow5VNhJ2KAH86i0UbSybuVTtT7Q/VaDc8JYj9vubn5LDPd6lPYid5C6qR4R9KT5hb3cfY+8Gc=
X-Received: by 2002:a05:6000:1568:b0:385:dc45:ea22 with SMTP id
 ffacd0b85a97d-38a223f835dmr50147101f8f.39.1736268553356; Tue, 07 Jan 2025
 08:49:13 -0800 (PST)
MIME-Version: 1.0
References: <20241231002336.25931-1-pbonzini@redhat.com>
 <20241231002336.25931-8-pbonzini@redhat.com>
In-Reply-To: <20241231002336.25931-8-pbonzini@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 7 Jan 2025 17:49:01 +0100
X-Gm-Features: AbW1kva1osy-KoUHQiF0jDUJx4pR-YIHhy6wptvPoHcpcL5tMNaP6cj6Di9jDmw
Message-ID: <CABgObfZ0O3r02v26+KiqAMNk2CSsYp8q2siN_f1xwUDXvT=VDg@mail.gmail.com>
Subject: Re: [RFC PATCH 7/9] rust: qemu_api: add vmstate_struct and
 vmstate_cell
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, zhao1.liu@intel.com, junjie.mao@hotmail.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: X1lVYrTB_ER_wfZOhyI7qFUFykDm97k_JO2TA_Are-w_1736268555
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.437,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 07 Jan 2025 16:49:19 -0000

On Tue, Dec 31, 2024 at 1:23=E2=80=AFAM Paolo Bonzini <pbonzini@redhat.com>=
 wrote:
>
> These are not type safe, but they're the best that can be done without
> const_refs_static.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

FWIW, I'll change these patch to support varrays in v2.

Paolo

> ---
>  rust/qemu-api/src/vmstate.rs | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>
> diff --git a/rust/qemu-api/src/vmstate.rs b/rust/qemu-api/src/vmstate.rs
> index b59a4b66339..e45c93587b2 100644
> --- a/rust/qemu-api/src/vmstate.rs
> +++ b/rust/qemu-api/src/vmstate.rs
> @@ -610,6 +610,40 @@ macro_rules! vmstate_array_of_pointer_to_struct {
>      }};
>  }
>
> +// FIXME: including the `vmsd` field in a `const` is not possible withou=
t
> +// the const_refs_static feature (stabilized in Rust 1.83.0).  Without i=
t,
> +// it is not possible to use VMS_STRUCT in a transparent manner using
> +// `vmstate_of!`.  While VMSTATE_CLOCK can at least try to be type-safe,
> +// VMSTATE_STRUCT includes $type only for documentation purposes; it
> +// is checked against $field_name and $struct_name, but not against $vms=
d
> +// which is what really would matter.
> +#[doc(alias =3D "VMSTATE_STRUCT")]
> +#[macro_export]
> +macro_rules! vmstate_struct {
> +    ($field_name:ident, $struct_name:ty, $vmsd:expr, $type:ty) =3D> {{
> +        $crate::bindings::VMStateField {
> +            name: ::core::concat!(::core::stringify!($field_name), "\0")
> +                .as_bytes()
> +                .as_ptr() as *const ::std::os::raw::c_char,
> +            offset: {
> +                $crate::assert_field_type!($struct_name, $field_name, $t=
ype);
> +                $crate::offset_of!($struct_name, $field_name)
> +            }
> +            size: ::core::mem::size_of::<$type>(),
> +            flags: $crate::bindings::VMStateFlags::VMS_STRUCT,
> +            vmsd: unsafe { $vmsd },
> +            ..$crate::zeroable::Zeroable::ZERO
> +        }
> +    }};
> +}
> +
> +#[macro_export]
> +macro_rules! vmstate_cell {
> +    ($field_name:ident, $struct_name:ty, $vmsd:expr, $type:ty) =3D> {
> +        $crate::vmstate_struct!($field_name, $struct_name, $vmsd, $type)
> +    };
> +}
> +
>  #[doc(alias =3D "VMSTATE_CLOCK_V")]
>  #[macro_export]
>  macro_rules! vmstate_clock_v {
> --
> 2.47.1
>


