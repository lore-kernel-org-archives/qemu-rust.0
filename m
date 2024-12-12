Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tLfQw-0007Kv-Jf
	for mharc-qemu-rust@gnu.org; Thu, 12 Dec 2024 04:24:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tLfQr-0007HU-Jm
 for qemu-rust@nongnu.org; Thu, 12 Dec 2024 04:24:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tLfQm-0003wP-RC
 for qemu-rust@nongnu.org; Thu, 12 Dec 2024 04:24:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733995462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UCPoUcz3IbO6Ol1LKAx9xk3J9o01+RkGpJmwZjt3/6Q=;
 b=edqHak7FESNYj61+Vo6AytJVKO2yqeftb/cl3XSbVHO533oFkSq2jSBg3N7LTDZuR9kjKH
 u0BnvutsGM6VbeEaXaf1NhjREFEKS4w+35eRTecx+pShH6oFSKgH8NhAbDhanrbCPBLg61
 uIOZwlKkq61vZ5+NSZ/JEQZ+wtijyWg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-338-O4ttx4JNNyKvsQSO9vaFMw-1; Thu, 12 Dec 2024 04:24:21 -0500
X-MC-Unique: O4ttx4JNNyKvsQSO9vaFMw-1
X-Mimecast-MFC-AGG-ID: O4ttx4JNNyKvsQSO9vaFMw
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-385e4a759e6so227639f8f.1
 for <qemu-rust@nongnu.org>; Thu, 12 Dec 2024 01:24:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733995460; x=1734600260;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UCPoUcz3IbO6Ol1LKAx9xk3J9o01+RkGpJmwZjt3/6Q=;
 b=J9grtbxRba1PEuZJLuXiaUOlV/4l6/JiCpK6r1uUY/6l9G3S8dSqdcOX7cU/+tyZTW
 RAOBHMtpV+okQP2I9WDKlHYigUXiTsiPx5qycvrnYn/GelQuzZtZjlOYs9wa1BETqdbR
 0T/gLzDDcLSphCs1oSHbh+hXKQmsTJY2IsntlFcNgw06EyfpTzHK5qBUqEZlh+OlvSbv
 EZXQqzoZuP/Cxa4LfrQZVzu4aUOYqTcge3mZai2Mu51XDhl4Q59IEadFdaAl9+/ccKF5
 KagPDWf7r+I0Dhp2NR38/FsMGsiXTh+8cuCnSUHUBp7vpeYUWXcx0CKmn36BybOzVKJO
 DP7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkXgNQs8Wy68TlvhN95n8tlmoj2HIYzPNJnQNfHDlEHQxFrXW8wloU5wrNIfabig8CzF0kZvIWST4=@nongnu.org
X-Gm-Message-State: AOJu0YydueQ5PKbT3zbNDR9XbBHYh8lTT83XV2iDTI5UQqFvyvmkWLYt
 QUx8xy+LXN7O4MDNUcg8JvlZ4WqqgQpIfGv2ZBVaHKYCW9Yb3yiPlC8Bt03WoRSCeFHK+hvtpWK
 T6/zVVus7ABfprn+P9Qu605NrZtJm2BzSvxN3MnIEeO1dRdHF9tVwEET7YN2bFogaY6FyokgzZh
 Up3XFk+bqQ0YNYLKPVgEAKIWy40Q==
X-Gm-Gg: ASbGncsjwziPwg9EpvjyShZcTuI45xTPzbfeZ4Hug/O6XOGKN8jF/ACPQ3gf7N5l2Pk
 b7DJAaErabB2uxgbtR1R7PX5RDI7bqVBpmyfPZg==
X-Received: by 2002:a05:6000:4803:b0:386:1cd3:8a00 with SMTP id
 ffacd0b85a97d-387877c9815mr2204198f8f.40.1733995459652; 
 Thu, 12 Dec 2024 01:24:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHwvdym2xWTLsMrHg8Ux8bfMcO+LLvwNJjs3EI5TZonsOmJjOREhXajeIW4wdcc6Dax335drSxVBgoK67k7sqQ=
X-Received: by 2002:a05:6000:4803:b0:386:1cd3:8a00 with SMTP id
 ffacd0b85a97d-387877c9815mr2204174f8f.40.1733995459267; Thu, 12 Dec 2024
 01:24:19 -0800 (PST)
MIME-Version: 1.0
References: <20241209123717.99077-1-pbonzini@redhat.com>
 <20241209123717.99077-15-pbonzini@redhat.com>
 <Z1hjX+5Yyi46N+sX@intel.com> <ada60844-546a-42ca-a05f-7b6dc225ff53@redhat.com>
 <Z1lGZdXsVR5ra4hl@intel.com>
 <CABgObfbs57rVNU4jTwUbPeZEbvEKpVPAZj0Pd8OF75D8ojQEMQ@mail.gmail.com>
 <Z1nEUmzHa5dA5C0d@intel.com>
In-Reply-To: <Z1nEUmzHa5dA5C0d@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 12 Dec 2024 10:24:05 +0100
Message-ID: <CABgObfY0T1N5-6ZwMWERsptEXHYhWnZP=TABGt3iovjtM3uWBA@mail.gmail.com>
Subject: Re: [PATCH 14/26] rust: qom: move bridge for TypeInfo functions out
 of pl011
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-rust@nongnu.org, 
 Junjie Mao <junjie.mao@hotmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: u0R9UZF0D16MyDvpS4T3ThFUeMOJeZ7u3TZeQkqy-K4_1733995460
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Thu, 12 Dec 2024 09:24:33 -0000

On Wed, Dec 11, 2024 at 5:38=E2=80=AFPM Zhao Liu <zhao1.liu@intel.com> wrot=
e:
>
> > Generally:
> >
> > - embedded objects will have to be initialized in instance_init unless =
they
> > are Options
>
> I see, at least for HPETTimer array, I need to prepare all of them in
> instance_init()...
>
> ...in realize(), also need to handle the "timers" property to enable
> the timers that property requires.

I see -- though, thinking more about it, since you have

    fn init_timer(&mut self) {
        let raw_ptr: *mut HPETState =3D self;

        for i in 0..HPET_MAX_TIMERS {
            let mut timer =3D self.get_timer(i).borrow_mut();
            timer.init(i, raw_ptr).init_timer_with_state();
        }
    }

It seems to me that you can do everything in instance_init. Later on a
function like the above
will become something like

impl HPETTimer {
    fn init_timer(hpet: NonNull<HPETState>, n: usize) -> impl PinInit<Self>=
 {
        pin_init!(&this in HPETTimer {
            index: n,
            qemu_timer <- Timer::init_ns(...),
            state: hpet,
            config: 0,
            cmp: 0,
            fsb: 0,
            cmp64: 0,
            period: 0,
            wrap_flag: false,
            last: 0,
        }
    }
}

But even now you can write something that takes a &mut self as the
first argument. It's undefined behavior but it's okay as long as we
have a path forward.

> > > > The way that this will become safe is to use the pinned_init crate =
from
> > > > Linux: instance_init returns the initialization as an "impl
> > > PinInit<Self>",
> > >
> > > Then do we need to place OBJECT in some suitable memory location (Box=
 or
> > > something) for Rust implementation?
> > >
> >
> > Allocation is still done by the C code, so I am not sure I understand t=
he
> > question. Rust code allocates QOM objects with object_new() so they are
> > malloc-ed.
>
> Sorry, I'm not familiar enough with this piece...I have the question
> because PinInit doc said "you will need a suitable memory location that
> can hold a T. This can be KBox<T>, Arc<T>, UniqueArc<T> or even the
> stack (see stack_pin_init!)."

Ah, I see. You can use __pinned_init directly on the memory that is
passed to rust_instance_init. See for example the implementation of
InPlaceWrite for Box
(https://docs.rs/pinned-init/latest/src/pinned_init/lib.rs.html#1307).

> I see that the core point is ensuring that structures cannot be moved.
> Given that object_new() on the C side ensures that the allocated object
> will not be moved, Rust side does not need to worry about pinning, correc=
t?

Sort of... You still need to worry about it for two reasons:

1) if you have &mut Self you can move values out of the object using
e.g. mem::replace or mem::swap. Those would move the value in memory
and cause trouble (think of moving a QEMUTimer while it is pointed to
by the QEMUTimerList). This is solved by 1) using &Self all the time +
interior mutability 2) using pinned_init's "PinnedDrop" functionality,
because &Self can be used in QEMU-specific APIs but (obviously) not in
the built-in Drop trait.

2) right now marking something as pinned is an indirect way to tell
the compiler and miri that there are external references to it. For a
longer discussion you can read
https://crates.io/crates/pinned-aliasable or
https://gist.github.com/Darksonn/1567538f56af1a8038ecc3c664a42462.

Linux does this with a wrapper type similar to the one in pinned-aliasable:

/// Stores an opaque value.
///
/// This is meant to be used with FFI objects that are never
interpreted by Rust code.
#[repr(transparent)]
pub struct Opaque<T> {
    value: UnsafeCell<MaybeUninit<T>>,
    _pin: PhantomPinned,
}

It's on my todo list to introduce it in qemu_api::cell and (for
example) change qom::Object from

    pub use bindings::Object

to

    pub type Object =3D Opaque<bindings::Object>;

Or something like that.

> Vec seems to lack proper vmstate support. I understand that we need to
> modify VMSTATE_STRUCT_VARRAY_POINTER_* to introduce a variant for Vec.
>
> Since the array support is already available, I chose to use an array
> instead (although vmstate is disabled for now).

Yes, you're right.

Palo


