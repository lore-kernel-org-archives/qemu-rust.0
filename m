Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tnemv-0004kc-Cu
	for mharc-qemu-rust@gnu.org; Thu, 27 Feb 2025 09:22:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tnemc-0003px-E6
 for qemu-rust@nongnu.org; Thu, 27 Feb 2025 09:22:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tnemS-00044D-9o
 for qemu-rust@nongnu.org; Thu, 27 Feb 2025 09:22:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740666147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4VkJ57zjgyHFgj0AXjaq86EaB5VXCZKU4ItaWiQb4aQ=;
 b=PCaezLXX9qeYml9+9NCD6g9F5Q59CgYNltu5OIr5wEbwiHRCsAFr7cohX0qgrAxXVrac+B
 HfbgTMu3WYmlbm79mz2oLNHkujwYsc/gvhpHjwWoucCuNBTEoYOOkAoykwVk0shKFXQlmL
 qrGCpe2ba5V9Nuw2Asv3v4EP2sUXbfE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-552-S8ygRj-VOZ2b0VWviNZTGA-1; Thu, 27 Feb 2025 09:22:22 -0500
X-MC-Unique: S8ygRj-VOZ2b0VWviNZTGA-1
X-Mimecast-MFC-AGG-ID: S8ygRj-VOZ2b0VWviNZTGA_1740666141
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-abbe5ac36a9so116623166b.2
 for <qemu-rust@nongnu.org>; Thu, 27 Feb 2025 06:22:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740666141; x=1741270941;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4VkJ57zjgyHFgj0AXjaq86EaB5VXCZKU4ItaWiQb4aQ=;
 b=HDm4MzJofv2DBqC+3V4Kfils0DOxZFyjh5FYO8HF/HQBWNl2SxBYoiwhcuHIjAzIAw
 rk3EcAG5s1xXgAgQa6pTVWMfsEHvR781+DB7hydMGlzakkuUdoD4d98LBg5mIJNM6aT/
 PVeHCXlDTiwKhfoWm6jk1ILyHxZbPaeeLRzoTq1n0jH+OfJG6PGwcoQK/4WkA71RWrZv
 4V/1tQQBQ9D/nD7ZZhVfU1VlvT1kpthYwXwv0nYcrxzPou+vUJ/qL7wzknhgKrh0Mn5l
 twaI6Hm7E++uBVQGzUV5KiQL2AYFwCTj1SxnZNxodeCv2ceNDdhh4/mbDitD2fiq0bA/
 F0tg==
X-Gm-Message-State: AOJu0YwYhgw17pIepETJO+b/pqq2W3jSyhuFzPB9IcBRgBE+ZbDQdSc7
 EVjWUVEFUntKSzcm4+dhxd5/P8dmc/H8RaP/r1zXPTp/cgODeVy12SF2GctQOOYlWnV5bujndCc
 k32ooCeYUs3S3nGQJ5hZMpUbwLG6Tbw0ptuWq7wIqzjG1dTyBn6E=
X-Gm-Gg: ASbGncuVawnQ3zPCbhqumTHS3l7bxtVetLttpjso4YF1EYVtJi0NiKEE698qWlAkDZH
 bbQ7EC+GC4Y5VEU/NpbmQw88aqG4WhhiN4UgL5i84D+B/wedd8b1pHiUELVIK6uqvZbYMqU2JlX
 nC20jpWUBuPzp42OMcNR7DQxx2M+obZ3ToDUVr3c4OQ3Q4RsZk6QQJyjnHnTC827Pxx34Ofgmbp
 TOGTm/77CU9Udw5Ivx2xWJPQeZp0mekvEHIItsTlJc2VUGCSdtLBiQ3a/UtQD3mBLcXj9afyqRY
 uH5xE1oRBc7tln6d6Lhv
X-Received: by 2002:a17:906:bc55:b0:abc:29a2:f6cf with SMTP id
 a640c23a62f3a-abc29a2f975mr1967488866b.19.1740666141194; 
 Thu, 27 Feb 2025 06:22:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFfOyAtyO7UXx6Jz11MRWvY8ssv+d7lcnv9b6HROoKZ2vu3FvYPvy0Oo3WROz7zqooaaQ9X7Q==
X-Received: by 2002:a17:906:bc55:b0:abc:29a2:f6cf with SMTP id
 a640c23a62f3a-abc29a2f975mr1967487266b.19.1740666140831; 
 Thu, 27 Feb 2025 06:22:20 -0800 (PST)
Received: from [192.168.10.48] ([176.206.102.52])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf181e0712sm82538066b.182.2025.02.27.06.22.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 06:22:20 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	zhao1.liu@intel.com
Subject: [PATCH v2 00/12] rust: wrap all C types exposed through qemu_api
Date: Thu, 27 Feb 2025 15:22:07 +0100
Message-ID: <20250227142219.812270-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 53mKIh_F1O-9ivn4UtBefbgBaPPp01qopuN2ZuxyC-M_1740666141
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.438,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 27 Feb 2025 14:22:45 -0000

This is the second part of "rust: prepare for splitting crates" with
Zhao's suggestions addressed and with more precise handling of pinning
for Timers.

The series introduce a third generic type in qemu_api::cell, Opaque<T>.
This type is similar to a same-named type in Linux; it is basically a
"disable all undefined behavior" switch for the Rust compiler and it
helps maintaining safety at the Rust/C boundary, complementing the
existing BqlCell and BqlRefCell types.

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

- more pertinent to the "multiple crates" plan that prompted posting
  of v1, you do not have to put the methods in the same crate as the
  bindgen-generated bindings.inc.rs.

It also makes Debug output a bit less unwieldy, and in the future one
might want to add specialized implementations of Display and Debug that
are both useful and readable.

Paolo

Supersedes: <20250221170342.63591-1-pbonzini@redhat.com>

v1->v2:
From Zhao's review:
- fix Opaque::zeroed()
- improve comments for as_mut_ptr() fand as_void_ptr()
- remove unnecessary ".0" accesses, or highlight why they're needed
- add patch to access SysBusDevice MMIO addresses safely

Other changes:
- improve safety comments for constructors of Opaque
- remove implementation of Default for Opaque<T: Default>,
  leaving Opaque::new() in but only as an unsafe function
- change Timer patch to construct timers as Pin<Box<Self>>,
  following the documentation of `Opaque<>`
- add "rust: vmstate: add std::pin::Pin as transparent wrapper"

Paolo Bonzini (12):
  rust: cell: add wrapper for FFI types
  rust: qemu_api_macros: add Wrapper derive macro
  rust: vmstate: add std::pin::Pin as transparent wrapper
  rust: timer: wrap QEMUTimer with Opaque<> and express pinning
    requirements
  rust: irq: wrap IRQState with Opaque<>
  rust: qom: wrap Object with Opaque<>
  rust: qdev: wrap Clock and DeviceState with Opaque<>
  rust: hpet: do not access fields of SysBusDevice
  rust: sysbus: wrap SysBusDevice with Opaque<>
  rust: memory: wrap MemoryRegion with Opaque<>
  rust: chardev: wrap Chardev with Opaque<>
  rust: bindings: remove more unnecessary Send/Sync impls

 docs/devel/rust.rst             |  36 +++--
 meson.build                     |   7 -
 rust/hw/timer/hpet/src/hpet.rs  |  27 ++--
 rust/qemu-api-macros/src/lib.rs |  86 +++++++++++-
 rust/qemu-api/meson.build       |   7 +-
 rust/qemu-api/src/bindings.rs   |  26 +---
 rust/qemu-api/src/cell.rs       | 228 +++++++++++++++++++++++++++++++-
 rust/qemu-api/src/chardev.rs    |   8 +-
 rust/qemu-api/src/irq.rs        |  15 ++-
 rust/qemu-api/src/memory.rs     |  37 +++---
 rust/qemu-api/src/qdev.rs       |  75 +++++++----
 rust/qemu-api/src/qom.rs        |  35 +++--
 rust/qemu-api/src/sysbus.rs     |  40 +++++-
 rust/qemu-api/src/timer.rs      |  47 ++++---
 rust/qemu-api/src/vmstate.rs    |   3 +-
 15 files changed, 527 insertions(+), 150 deletions(-)

-- 
2.48.1


