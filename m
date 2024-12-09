Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tKd18-0003m1-DP
	for mharc-qemu-rust@gnu.org; Mon, 09 Dec 2024 07:37:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tKd10-0003k8-Fo
 for qemu-rust@nongnu.org; Mon, 09 Dec 2024 07:37:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tKd0x-0007Ni-6B
 for qemu-rust@nongnu.org; Mon, 09 Dec 2024 07:37:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733747843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zZQyy3tQP8OD/1fdEQoI4TyeNI1Ugh3Z/zVs5dSJoV4=;
 b=CEmlQGyx6zKBnYnlG/3/kdFxWw/bDkIvMLVG/uj/UcJFt2g6g6sdty0pQSFkgkrk1T3uzx
 O/fFR6KAFNg4iai4kvPlDjQ/UvVkWzGbqKgYRyZFnsqG8MpT12L7WkSImHbq9VXPFIfWMh
 tPC87e8MeRVxln69mwuk7ylvwxLz/Jc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-ySA4ezzpPBS4DDCAkM2R_Q-1; Mon, 09 Dec 2024 07:37:22 -0500
X-MC-Unique: ySA4ezzpPBS4DDCAkM2R_Q-1
X-Mimecast-MFC-AGG-ID: ySA4ezzpPBS4DDCAkM2R_Q
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-434f112d83aso13043575e9.3
 for <qemu-rust@nongnu.org>; Mon, 09 Dec 2024 04:37:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733747840; x=1734352640;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zZQyy3tQP8OD/1fdEQoI4TyeNI1Ugh3Z/zVs5dSJoV4=;
 b=hRyRSa1B/p8xozwBdo08lIRHHbxB1+i3J+KR8i7WnN87RqmW594R8ibzXqsusEWdd4
 ipyY8IXdlrZqkxsA9Foqir7Re38A/juL6hZRgduo9JsssdsIth6ZISzfwKfgQdKAsvaQ
 m5WhFUcPhtxLXENLStzMnK5T2eNhYVHV/7WoikIRxsn4wU64xca5OxN9yYjgx33v7bXd
 gqUhb56EJ75cyvZLcgmIwMNx9YlwHywQP8mhFEwAz25WA7iV9ZV62GOmU3gqkpTFJoHN
 cSMugIWdo4rQcuZTK455n/sMByolgqlLJUNrgd1uh17lzb7h3hmTM/QKv3hJC/1lRSbR
 f1/Q==
X-Gm-Message-State: AOJu0YxqRys0KrcFk4JCTUIKr/Wc2ISwdj82MExHf04o7++RcI66T8oG
 g+JPeZAwmJdhsLvVrGrQvSAVfmR5+H3cGXj1hwoN8Em6NXfheCVXMNDMKHCJJtKigxkp1WD0VVm
 KP57FgAf52YabOBgEHQgZe0Dy5FvxlLFR00IWcYvjNlnYg+siZIg09Llcaq8=
X-Gm-Gg: ASbGncssCvTrQ5m1I7LF3qsGJL6Pwn150T6hEsXQpAVwu5H4gJulLjnyNPAe7da6ERv
 fhY5aNTk3rwSp0Gs+3WB2s+yuYwQUFwi7w+n+8Iz1YXn+/ICEMlTdj84mArzO02DF3MnsR7lELO
 Zd8zM5ffXMnpOpwnTYO5EHUwvTzJ54qIT0F9B1od+Icc9kfSkUTiIiTPH05Xe4GVbE+xoPXMu6m
 fQLr7Ut0z303ydWvzDroKKuXWRGiUeXyNH/1d0mc8DgTt3/CkT9uA==
X-Received: by 2002:a05:6000:4007:b0:385:f1d6:7b6a with SMTP id
 ffacd0b85a97d-3862b3cf82fmr9949586f8f.55.1733747840310; 
 Mon, 09 Dec 2024 04:37:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGolfB89T8KXr5Cv135D5++LYQhk9wH3nb1mgiHOKNvN464Xu7YokNKKTOvxu6HnRBtGViNEA==
X-Received: by 2002:a05:6000:4007:b0:385:f1d6:7b6a with SMTP id
 ffacd0b85a97d-3862b3cf82fmr9949565f8f.55.1733747839849; 
 Mon, 09 Dec 2024 04:37:19 -0800 (PST)
Received: from [192.168.10.47] ([151.81.118.45])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3862a4ae481sm10589989f8f.25.2024.12.09.04.37.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 04:37:19 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Junjie Mao <junjie.mao@hotmail.com>
Subject: [PATCH 00/26] rust: bundle of prerequisites for HPET implementation
Date: Mon,  9 Dec 2024 13:36:51 +0100
Message-ID: <20241209123717.99077-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PDBjTAIkoCSVKShxQ6zqDTbMFTi5kGxbTMMj2NOFpn0_1733747841
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.489,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_SBL_A=0.1 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 09 Dec 2024 12:37:36 -0000

These are the initial set of bindings and support code that are needed
to apply Zhao's posted HPET implementation, and for him to apply
my review comments.  They include:

- QOM cleanups (already posted)

- interrupts sources and cells (posted and reviewed)

- bit deposit and extract operations (new)

- QOM generalization beyond DeviceState (new)

- callbacks system (new)

This is the code that I aim at integrating in QEMU 10.0, and is also
what is needed to develop additional bindings (for e.g. timers) more
or less independently.  I'll focus here on the changes to QOM because they
represent the bulk of the patches.  The bit operations and callbacks are
just one or two patches each, and better explained by the doc comments
in the patch itself.

With respect to qdev, some of this was already explained in the "Rust
in QEMU roadmap".  The patches are split in two series, corresponding
to patches 7-14 and 15-24.

The first and previously posted part mostly removes code duplication,
while keeping the focus very much on four elements of DeviceClass
(realize, legacy reset, properties, vmstate).

The second instead starts to establish a correspondence between the
QOM class hierarchy and the Rust trait system.  The hierarchy of classes
is visible as an ObjectImpl::ParentType associated type, and also present
in the implementation of the ClassInitImpl<ClassType> trait.  The
ClassInitImpl trait is implemented for each Rust-defined QOM class as
before, but now its implementation is split over multiple blanket impls,
one for each superclass.  This allows code reuse of the class_init
wrappers, and is implemented in patches 15-18.

After a brief cleanup intermission in patches 19-21, patches 22-23 provide
the method invocation infrastructure.  Taking inspiration from glib-rs's
GObject bindings, an IsA<> trait declares what is a subclass of what,
which allows two things:

- safe and efficient typecasts, which are compile-time checked so that
  it is an error if the destination type is not a superclass.

- automatically making methods available to all subclasses.  This is done
  through another blanket implementation of a trait, as in glib-rs (see
  https://gtk-rs.org/gtk4-rs/stable/latest/docs/src/gtk4/auto/widget.rs.html#5377),
  though the details are a bit different.

The differences with glib-rs are not small, but fortunately it is the QEMU
version that is simpler.  QEMU does not use a complicated macro like glib's
(https://gtk-rs.org/gtk-rs-core/git/docs/glib/macro.wrapper.html)  to
wrap all subclasses of GObject with an opaque Rust type.  While macros
in general, and procedural macros in particular, may be a useful tool(*),
for now I prefer to ensure that the infrastructure is usable and readable
even without any macro magic.

The two pieces allow defining QOM class hierarchies entirely in Rust;
patch 24 for example gives TYPE_PL011 its own class type PL011Class,
and stores the device id in PL011Class instead of PL011State.

I understand that this is a lot of code, and a lot of added lines in
particular.  Fortunately about 40% of it is docs, which is definitely
a change for QEMU's standards. :)  Also all except the last two patches
have already been used by Zhao, who did not report any particular problem
adopting them.

Excepting the docs, the bulk of the new code is in the BqlCell and
BqlRefCell implementations, as well as in patch 22.  Fortunately these
patches are also relatively boring.  The more interesting patches to
review are patch 15-18 for QOM, and 25 for the callbacks.  Patch 25 is
also the trickiest to explain from the point of view of using advanced
language features; (**) I tried to explain that in the doc comments
and commit messages but please ask for more if necessary.

This series is available at branch rust-next of
https://gitlab.com/bonzini/qemu.git.
Thanks,

Paolo

(*) For example they could automate the declaration of various traits,
many of which are "unsafe" as a reminder that they interact with C code.
This should be pretty easy, considering that the amount of code required
to write QOM types is already smaller in Rust than in C.  qdev properties
are also a useful target, as exemplified by Manos's previously posted
series.

(**) In particular, zero-sized types and the Fn trait.


Paolo Bonzini (26):
  bql: check that the BQL is not dropped within marked sections
  rust: cell: add BQL-enforcing Cell variant
  rust: cell: add BQL-enforcing RefCell variant
  rust: define prelude
  rust: add bindings for interrupt sources
  rust: add a bit operation module
  rust: qom: add default definitions for ObjectImpl
  rust: qom: rename Class trait to ClassInitImpl
  rust: qom: convert type_info! macro to an associated const
  rust: qom: move ClassInitImpl to the instance side
  rust: qdev: move device_class_init! body to generic function,
    ClassInitImpl implementation to macro
  rust: qdev: move bridge for realize and reset functions out of pl011
  rust: qom: automatically use Drop trait to implement instance_finalize
  rust: qom: move bridge for TypeInfo functions out of pl011
  rust: qom: split ObjectType from ObjectImpl trait
  rust: qom: change the parent type to an associated type
  rust: qom: put class_init together from multiple ClassInitImpl<>
  rust: qom: add possibility of overriding unparent
  rust: rename qemu-api modules to follow C code a bit more
  rust: re-export C types from qemu-api submodules
  rust: tests: allow writing more than one test
  rust: qom: add casting functionality
  rust: qom: add initial subset of methods on Object
  rust: qom: move device_id to PL011 class side
  rust: qemu-api: add a module to wrap functions and zero-sized closures
  rust: callbacks: allow passing optional callbacks as ()

 include/qemu/main-loop.h               |  15 +
 stubs/iothread-lock.c                  |  15 +
 system/cpus.c                          |  15 +
 rust/Cargo.toml                        |   1 +
 rust/hw/char/pl011/src/device.rs       | 156 ++---
 rust/hw/char/pl011/src/device_class.rs |  34 -
 rust/qemu-api-macros/src/lib.rs        |   2 +-
 rust/qemu-api/Cargo.toml               |   3 +-
 rust/qemu-api/meson.build              |  14 +-
 rust/qemu-api/src/bitops.rs            | 119 ++++
 rust/qemu-api/src/callbacks.rs         | 238 +++++++
 rust/qemu-api/src/cell.rs              | 822 +++++++++++++++++++++++++
 rust/qemu-api/src/definitions.rs       |  91 ---
 rust/qemu-api/src/device_class.rs      |  74 ---
 rust/qemu-api/src/irq.rs               |  91 +++
 rust/qemu-api/src/lib.rs               |  15 +-
 rust/qemu-api/src/module.rs            |  43 ++
 rust/qemu-api/src/prelude.rs           |  18 +
 rust/qemu-api/src/qdev.rs              | 146 +++++
 rust/qemu-api/src/qom.rs               | 556 +++++++++++++++++
 rust/qemu-api/src/sysbus.rs            |  51 ++
 rust/qemu-api/src/vmstate.rs           |   9 +-
 rust/qemu-api/tests/tests.rs           | 208 +++++--
 23 files changed, 2374 insertions(+), 362 deletions(-)
 create mode 100644 rust/qemu-api/src/bitops.rs
 create mode 100644 rust/qemu-api/src/callbacks.rs
 create mode 100644 rust/qemu-api/src/cell.rs
 delete mode 100644 rust/qemu-api/src/definitions.rs
 delete mode 100644 rust/qemu-api/src/device_class.rs
 create mode 100644 rust/qemu-api/src/irq.rs
 create mode 100644 rust/qemu-api/src/module.rs
 create mode 100644 rust/qemu-api/src/prelude.rs
 create mode 100644 rust/qemu-api/src/qdev.rs
 create mode 100644 rust/qemu-api/src/qom.rs
 create mode 100644 rust/qemu-api/src/sysbus.rs

-- 
2.47.1


