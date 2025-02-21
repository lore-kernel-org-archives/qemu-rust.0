Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tlWRO-0006cv-AP
	for mharc-qemu-rust@gnu.org; Fri, 21 Feb 2025 12:03:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tlWRM-0006YE-BJ
 for qemu-rust@nongnu.org; Fri, 21 Feb 2025 12:03:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tlWRJ-0001Nn-HO
 for qemu-rust@nongnu.org; Fri, 21 Feb 2025 12:03:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740157427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4D1rS6LJ8uetAUltK3BGbFAyS6KEzRUZM0URC1DoiWU=;
 b=MxbBgeAXTYy3eO7QLXkZwtAZlp4ATJLCVdowwaSJO7kBjdargnWegBlAYZA7Xo5o/obHEd
 HR69A4TGlRZC6WGf5wAtdFRJo+E2/dyqQ9QdF17hrD3myqwRD4aB8jAvd1TuL3RvPLQZOc
 W+y6LNdCjFDns+9YDR/Lf3bsgvxqycI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-482-pbmuFKUcP8CiIj3JqDJGmQ-1; Fri, 21 Feb 2025 12:03:46 -0500
X-MC-Unique: pbmuFKUcP8CiIj3JqDJGmQ-1
X-Mimecast-MFC-AGG-ID: pbmuFKUcP8CiIj3JqDJGmQ_1740157425
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4398a60b61fso12253865e9.0
 for <qemu-rust@nongnu.org>; Fri, 21 Feb 2025 09:03:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740157424; x=1740762224;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4D1rS6LJ8uetAUltK3BGbFAyS6KEzRUZM0URC1DoiWU=;
 b=ifak4yYpSKC7t4Y2T8XEuXo7V25mE/qUcsVO1nwWp5bMm87oT32oco5AwR4xNcDZcT
 FjPbysRqsPa4W0YnzoqVxdicLO/YHsGMGCJ082CFxtsxMr/j1rjrQst75n+sO5x2X4Z/
 +RADQzBqaM3MHdC2idx3GD9C8DQNk/ciGhhuR6l/f+Oowu0PXJCPbIEcISjY6/u5ryJD
 g1keFo+8AT3zZIMVj4Goc063j//40IyKdG1o+aLZUUVDgr1M17jPkkJ2Cz3FuTrBFlc3
 ZBj4q8cWx+EjRj7c27z9nsCUfZuDQYFlpuGGuWmICDgslUL0oT7eWf/RbE6DfUc9ey5P
 9TQw==
X-Gm-Message-State: AOJu0Yzkxjy/TUkxP3n0Pusx7qs2cGsbd/voDLfMxTv9xXRBM1FWcOon
 jDeUnEDvqGD4l3ZBtjWAmeNht4h9TIhwXtwroRbmQkE9tuvQNrL0H5J8ASuwJPN1RTTl1VtU8S3
 NX3FJiXIA/XEFVGMk3eaP/0XKodgHtPRPDI/YGfeUpOk8I9G5czHHfuGSRl2w3Q==
X-Gm-Gg: ASbGncvR5YsIE86IUGRRnfmP0jEKsfsn9C0rcVe39vK+fHpodhKt35ljM1ZLWs1FhrE
 +SNfI3dp9QRRH13x73sEcbiXGDUtQNPfAfnOOO20uQA7YNHYN9V0eZmy+YCRKA0Cj6XE+Pw6bXw
 hd2pu4UL0+Gq7um176m8al9E0iH5kAresk29XRR5CTcuNWYy4NCGv9nqThMPuhhrCmBkHQEBRXA
 iY4WWlqGJv9ryh9TkVQfvZoBE8oH1oQXmZzEwwVDc6zMvN5LmOn5wHMhw8Ef8Pdct+QFWSMchA2
 lav4tBGx30qSpi4pxNU=
X-Received: by 2002:a05:600c:1f8c:b0:439:88bb:d020 with SMTP id
 5b1f17b1804b1-439ae1e66f8mr29825925e9.8.1740157424205; 
 Fri, 21 Feb 2025 09:03:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHL1QNKtVNsYYu2DzODP1Qt6vrjg89Q9V0r6w2kBwKtZV0SF6/7qQPuZ1BBaJKO4gMQV70qJg==
X-Received: by 2002:a05:600c:1f8c:b0:439:88bb:d020 with SMTP id
 5b1f17b1804b1-439ae1e66f8mr29825275e9.8.1740157423525; 
 Fri, 21 Feb 2025 09:03:43 -0800 (PST)
Received: from [192.168.10.48] ([151.95.61.185])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b02ce38csm23773225e9.6.2025.02.21.09.03.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 09:03:43 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 00/15] rust: prepare for splitting crates
Date: Fri, 21 Feb 2025 18:03:27 +0100
Message-ID: <20250221170342.63591-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Lhkc0kUE3MbU8_xnQLzd0HdEeCHM7KlDlTCy5jZtjzY_1740157425
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.424,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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
X-List-Received-Date: Fri, 21 Feb 2025 17:03:52 -0000

This series is logically split in two parts.  The first one is more
strictly tied to the objective of splitting qemu_api into multiple crates,
as it breaks the QOM bindings free of the constraints imposed by Rust
orphan rules.  The second one instead completes another task that was on
my todo list, namely ensuring that rustc sees the possible changes that
C functions can make when a shared reference &bindings::Foo is passed
via *mut bindings::Foo.

More in detail, patches 1-5 redo the QOM class init mechanism so that
it does not rely on the ClassInitImpl trait.  While ClassInitImpl is
very nice in theory, it practice it does not play well with classes
defined outside qemu_api (or more precisely, outside the crate that
defines ClassInitImpl itself).  This is because ClassInitImpl relies on
a blanket implementation such as

    impl<T> ClassInitImpl<ObjectClass> for T
    where
        T: ObjectImpl

and this is only possible inside the crate that defines ClassInitImpl.
With these patches the class_init methods move from ClassInitImpl<Class>
to the Class struct itself.  More precisely, before the series you
have

    <T as ClassInitImpl<ObjectClass>>::class_init

and afterwards

    ObjectClass::class_init::<T>

which is assigned to the CLASS_INIT associated const of ObjectImpl.
The problem is that even if CLASS_INIT is always defined the same
way, i.e.

    const CLASS_INIT: fn(&mut Self::Class) = Self::Class::class_init::<Self>;

there isn't a way to tell the compiler that the above is valid *in the
definition of ObjectImpl*.  Therefore the above line has to be duplicated
in all subclasses; this however is a small issue and in the future it
could be handled by #[derive(Object)].

Patches 6-15 instead introduce a third generic type in qemu_api::cell,
Opaque<T>.  This type is similar to a same-named type in Linux; it is
basically a "disable all undefined behavior" switch for the Rust compiler
and it helps maintaining safety at the Rust/C boundary, complementing
the existing BqlCell and BqlRefCell types.

Apart from making things more formally correct, this makes it possible
to implement methods on a struct that is distinct from the one produced
by bindgen.  This has a couple of advantages:

- you do not have to disable the Copy trait on structs where you want
  to add a Drop trait.  This was already a problem for the Timer struct.

- whether Send and Sync are implemented is entirely a decision of the
  place that implements the wrapper.  Previously, a struct with no
  pointers for example would have been always both Send and Sync,
  whereas now that can be adjusted depending on the actual
  thread-safety of the Rust methods.

- more pertinent to the "multiple crates" plan, you do not have to put
  the methods in the same crate as the bindgen-generated bindings.inc.rs.

It also makes Debug output a bit less unwieldy, and in the future one
might want to add specialized implementations of Display and Debug that
are both useful and readable.

Paolo

Paolo Bonzini (15):
  rust: add IsA bounds to QOM implementation traits
  rust: add SysBusDeviceImpl
  rust: qom: add ObjectImpl::CLASS_INIT
  rust: pl011, qemu_api tests: do not use ClassInitImpl
  rust: qom: get rid of ClassInitImpl
  rust: cell: add wrapper for FFI types
  rust: qemu_api_macros: add Wrapper derive macro
  rust: timer: wrap QEMUTimer with Opaque<>
  rust: irq: wrap IRQState with Opaque<>
  rust: qom: wrap Object with Opaque<>
  rust: qdev: wrap Clock and DeviceState with Opaque<>
  rust: sysbus: wrap SysBusDevice with Opaque<>
  rust: memory: wrap MemoryRegion with Opaque<>
  rust: chardev: wrap Chardev with Opaque<>
  rust: bindings: remove more unnecessary Send/Sync impls

 docs/devel/rust.rst              |  36 +++--
 meson.build                      |   7 -
 rust/hw/char/pl011/src/device.rs |  44 +++---
 rust/hw/timer/hpet/src/hpet.rs   |   7 +-
 rust/qemu-api-macros/src/lib.rs  |  82 +++++++++++-
 rust/qemu-api/meson.build        |   7 +-
 rust/qemu-api/src/bindings.rs    |  26 +---
 rust/qemu-api/src/cell.rs        | 222 ++++++++++++++++++++++++++++++-
 rust/qemu-api/src/chardev.rs     |   8 +-
 rust/qemu-api/src/irq.rs         |  15 ++-
 rust/qemu-api/src/memory.rs      |  32 ++---
 rust/qemu-api/src/qdev.rs        | 115 ++++++++++------
 rust/qemu-api/src/qom.rs         | 203 ++++++++++++++--------------
 rust/qemu-api/src/sysbus.rs      |  45 ++++---
 rust/qemu-api/src/timer.rs       |  24 +++-
 rust/qemu-api/src/vmstate.rs     |   2 +-
 rust/qemu-api/tests/tests.rs     |  32 ++---
 17 files changed, 620 insertions(+), 287 deletions(-)

-- 
2.48.1


