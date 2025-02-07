Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tgLPl-0007MY-EI
	for mharc-qemu-rust@gnu.org; Fri, 07 Feb 2025 05:16:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tgLPX-0007Ii-NE
 for qemu-rust@nongnu.org; Fri, 07 Feb 2025 05:16:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tgLPV-0003fW-0T
 for qemu-rust@nongnu.org; Fri, 07 Feb 2025 05:16:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738923390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WfSf2kR+KPzGYZoZgRGQYLCZot2N1LSU/8KPAc59nEg=;
 b=EkzQMjhUvyFnEXkZBF0N1AVWXC9v8GA2El6XgZcW0qoxlvo50AKiTrYMphu2h0yXEPtvTv
 Zu11+gD2hD8CkoL4ZOtiE1GB8iRykxQqeihgNop9DnV3m3ckVf0OuLjr/w99J6o2xukZzq
 0nBUUwq//iZM8ILbMLmdBLYukyNDGxs=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-ESmIx1PIPC6TDkDVEj-vCA-1; Fri, 07 Feb 2025 05:16:29 -0500
X-MC-Unique: ESmIx1PIPC6TDkDVEj-vCA-1
X-Mimecast-MFC-AGG-ID: ESmIx1PIPC6TDkDVEj-vCA
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-ab7907bb87eso39150466b.3
 for <qemu-rust@nongnu.org>; Fri, 07 Feb 2025 02:16:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738923388; x=1739528188;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WfSf2kR+KPzGYZoZgRGQYLCZot2N1LSU/8KPAc59nEg=;
 b=oayQiHZZ+UMJytvj2EfMi9tA3DOwTY72w953mp2zw4MTP28HgtgziUJtbDjlJ2PoH+
 Lk94oaX4dqr9/5yo6peA2bbiT6i2MwrQ9PLVlK0fkpP6mu5W4ZiBAkcRndiCSWoGs84c
 dbDe6pEo4lCuhkMorhpFypm6n7YVxbCqV7ZfKm+T3vmtsmT1WeRyytbcBWClG5CEQ60X
 +mTgKGM+Bex/Q4KZ2tfbXEiYr4GhQ14VLeCe3W+3pO95FFlmHtYVgmiqJYhWu7R2C8c3
 lwzPwzLKyomWv1QvfI4it2lWL5whHd0BJBKpmeJFyVgPiSbjUu1K0Gfobsr3ACQxWymY
 ne7A==
X-Gm-Message-State: AOJu0YxBBIlyz+XKklRDaWsY29mrPPe413CbWY4sw7wUs4XO1XL2GFp3
 kW4SheATuPPh8XV+NSdaH1WfseR0ghmfT+5Wmf63yoC9gAwNYqGBDs/jaVIIPABec6NFtADCWik
 cdywnAKIiG+tnCJd4EGMAJB0ze+FPiPwF1pGxCEuARiNn66JanYw=
X-Gm-Gg: ASbGncs3KNI/jSP5KAFwwMNbn4o/4fXDCWT41LuhtwDT0b676epoZXH5vVcIjdbZLuO
 tZv8O9LmzZhddyV1NtDBq7yREuhGOnu7EHT9Nq4c/DB8Vxydk/l6SQmdmhaKDijlyRp3zFw6vNq
 qYIozvmLuHQJBX9h4b984XcraUQxnE60bD3u1I9ALbiIkocJeUAOyTRkzGnx/i7Fr3r+dQSwVxE
 088CLF6zw9ejgFn2byX00KFNaFkhv+1vQB1X0OEJNG8+LGdqSat4xnAqeF16OverVudVBvzaPlV
 I61yKg==
X-Received: by 2002:a17:907:7b9c:b0:ab6:dbd2:df78 with SMTP id
 a640c23a62f3a-ab789c62da8mr266969366b.35.1738923386722; 
 Fri, 07 Feb 2025 02:16:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTL9U5CDgnSIv/7MajCE2s3sb7k8RK9tIeNNAZoR/G9cmHnAefxIlgeA+16DiCL+IsNCutuA==
X-Received: by 2002:a17:907:7b9c:b0:ab6:dbd2:df78 with SMTP id
 a640c23a62f3a-ab789c62da8mr266964366b.35.1738923386303; 
 Fri, 07 Feb 2025 02:16:26 -0800 (PST)
Received: from [192.168.10.3] ([151.62.97.55])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab77365fc7dsm237097866b.182.2025.02.07.02.16.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 02:16:25 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	zhao1.liu@intel.com
Subject: [PATCH 00/12] rust: remaining parts of qdev bindings
Date: Fri,  7 Feb 2025 11:16:11 +0100
Message-ID: <20250207101623.2443552-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: P7FmxiR3Sx9cAJEAcB1Fny912LMmpYEgEuFKeNgwB1A_1738923388
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Fri, 07 Feb 2025 10:16:35 -0000

This concludes the part of the qdev bindings that is needed to convert
pl011 to safe Rust, with the exception of chardev bindings and switching
to the pinned_init crate.

It includes reference counting, object creation, clocks, Resettable
and MemoryRegionOps.  Documentation is at least decent.

The code is getting closer to the synopsis at
https://lists.nongnu.org/archive/html/qemu-rust/2024-12/msg00006.html,
except that it works (at least as far as CI is concerned) instead of just
compiling. :)  And since I'm citing it, a reminder that it may still be
worth asking your Rust questions as replies to that message.

You can find the code in the rust-next branch of
https://gitlab.com/bonzini/qemu/.

Paolo

RFC->v1:
- improvements and fixes for docs and comments
- fixed Sync/Send declarations for Owned
- prefer NonNull::cast (could use NonNull<> arguments too in the future)
- add Send markers too, not just Sync
- use impl_zeroable! macro
- add qdev_init_clock_out() too
- add comments about when to use Owned<>
- add Owned::clone
- add conversion of pl011_create to safe Rust for more uses of Owned<>

Paolo Bonzini (12):
  rust: qom: add reference counting functionality
  rust: qom: add object creation functionality
  rust: callbacks: allow passing optional callbacks as ()
  rust: qdev: add clock creation
  rust: qom: allow initializing interface vtables
  rust: qdev: make ObjectImpl a supertrait of DeviceImpl
  rust: qdev: switch from legacy reset to Resettable
  rust: bindings: add Send and Sync markers for types that have bindings
  rust: bindings for MemoryRegionOps
  rust: irq: define ObjectType for IRQState
  rust: chardev, qdev: add bindings to qdev_prop_set_chr
  rust: pl011: convert pl011_create to safe Rust

 meson.build                          |   1 +
 rust/hw/char/pl011/src/device.rs     | 121 +++++++-------
 rust/hw/char/pl011/src/lib.rs        |   1 -
 rust/hw/char/pl011/src/memory_ops.rs |  34 ----
 rust/qemu-api/meson.build            |   2 +
 rust/qemu-api/src/bindings.rs        |  46 ++++++
 rust/qemu-api/src/callbacks.rs       |  97 ++++++++++++
 rust/qemu-api/src/chardev.rs         |  19 +++
 rust/qemu-api/src/irq.rs             |  18 ++-
 rust/qemu-api/src/lib.rs             |   2 +
 rust/qemu-api/src/memory.rs          | 191 ++++++++++++++++++++++
 rust/qemu-api/src/prelude.rs         |   4 +
 rust/qemu-api/src/qdev.rs            | 227 ++++++++++++++++++++++++---
 rust/qemu-api/src/qom.rs             | 218 ++++++++++++++++++++++++-
 rust/qemu-api/src/sysbus.rs          |  39 ++++-
 rust/qemu-api/src/vmstate.rs         |  10 +-
 rust/qemu-api/src/zeroable.rs        |   1 +
 rust/qemu-api/tests/tests.rs         |  45 +++---
 18 files changed, 924 insertions(+), 152 deletions(-)
 delete mode 100644 rust/hw/char/pl011/src/memory_ops.rs
 create mode 100644 rust/qemu-api/src/chardev.rs
 create mode 100644 rust/qemu-api/src/memory.rs

-- 
2.48.1


