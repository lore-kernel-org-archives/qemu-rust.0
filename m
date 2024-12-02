Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tI4G2-00050F-RB
	for mharc-qemu-rust@gnu.org; Mon, 02 Dec 2024 06:06:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tI4Fw-0004yT-Fg
 for qemu-rust@nongnu.org; Mon, 02 Dec 2024 06:06:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tI4Ft-0005B3-2T
 for qemu-rust@nongnu.org; Mon, 02 Dec 2024 06:06:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733137575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=epCOQ4jQIaJ5d4pHL683hSqsE8Ow7X/ht8e7hANUPUI=;
 b=LjFt6JuuBdS8Imwm6JJ+iV4Tr+rHsIW+ICtT/l7NK33Dx1SDcEBKgMcoZbBeWKfTFUZuWP
 jFUpDx1Nbqp21Ek4wF38iBwdIoO8PVK07OLCPyAvMhUeCQEwks2rw/1UjKJep92kBMN9gb
 vKecnrnYX8RS7aMP6P1gZIeAkumT5lQ=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-483-BFqe92VwOTyTdEft1WvtzA-1; Mon, 02 Dec 2024 06:06:14 -0500
X-MC-Unique: BFqe92VwOTyTdEft1WvtzA-1
X-Mimecast-MFC-AGG-ID: BFqe92VwOTyTdEft1WvtzA
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7b66f8fb697so450445285a.1
 for <qemu-rust@nongnu.org>; Mon, 02 Dec 2024 03:06:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733137573; x=1733742373;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=epCOQ4jQIaJ5d4pHL683hSqsE8Ow7X/ht8e7hANUPUI=;
 b=IVYElSZrL6vQxHdG4zypKstM46t2r0BVO4cJutWi0AyVMesCn0Gf//gqtlTAn3JMjk
 GKgyfoLur/7z2/DzfxNNqw0iWD29zDghH2l7gchsfXMEj1vvoaLcJdULopBhV78vYXBI
 rpQZAlDQndz1hbD5KxV1FhqgGjxgz76I9cOg3wtm8ucQ2LanK+2pTGoqpRecKZntAP96
 yy1zGtFNabZDkdxyFNmi5vRGy+m9eHIpjKCDJb93dFHJCwSE/fmQH4mzejGnQjiurxqr
 hy/V7dfHceZXRVUR7pqj9UEaTU3MJiamFINFi5C5fHv+EkgRO1uObKaie9D9qc56cYDu
 +QOw==
X-Gm-Message-State: AOJu0Yw3R6qAA2ObXPhfJkF+LYUPQpxGQRPpL068gXMEPhdMjsTbYSNj
 o/yX1/5krrCS9RUg4umfLKbng9689PrnIcpDiBNm7holIdaAAAQ75JzoDfMRwQ9PGif4t9euP2E
 mK+vgc/nMZY1suIc5EXs4+YjEeMwdmjAW7BJ8ovWg3ZGdv0io4bYqZMF3fn8=
X-Gm-Gg: ASbGncsHpwlbgj5QCVeGuF+27t44K7tPInriwXyhc5PqMAgRw4QS0Y9lUgg7sDKAD1X
 KbhiTqnFV0KndHsYdMPawvjcUO2hQ7BAB0AsHbTKt4bjzGs46+ONMy3gZGDucuE/qwmF7YzKGo0
 hMQL32BwSgyU5ofSp88a/Khr44zv8dZwdnmOFmfWa2C3iDVn+yOI1aqIZ8HertBkIcblICVc5MO
 FBHL0JujCc8/ZsveQWoTuP9c9FSlWAStV7stCecjvmu57f8twtSp0P3VkGDF4K60aBHM5eXSeeZ
 HnU=
X-Received: by 2002:a05:620a:372c:b0:7b6:6756:eeef with SMTP id
 af79cd13be357-7b67c250b04mr3906371385a.1.1733137573135; 
 Mon, 02 Dec 2024 03:06:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDENL5CcPzE0h10w3feCErXg76ZgbzoTd5RIXbk+A506Mt9tSp+TL/MXzvzscR8vxILuuLdw==
X-Received: by 2002:a05:620a:372c:b0:7b6:6756:eeef with SMTP id
 af79cd13be357-7b67c250b04mr3906365585a.1.1733137572598; 
 Mon, 02 Dec 2024 03:06:12 -0800 (PST)
Received: from [192.168.122.1] (nat-pool-mxp-t.redhat.com. [149.6.153.186])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b6849c4b05sm391103685a.122.2024.12.02.03.06.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 03:06:11 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH v2 0/2] rust: safe wrappers for interrupt sources
Date: Mon,  2 Dec 2024 12:06:07 +0100
Message-ID: <20241202110609.36775-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lIxa_1ZONWYKZMRq6350_CjKx3na0ro-GC3MuFJOf8g_1733137574
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Mon, 02 Dec 2024 11:06:20 -0000

Interrupt sources, qemu_irq in C code, are pointers to IRQState objects.
They are QOM link properties and can be written to outside the control
of the device (i.e. from a shared reference); therefore their Rust
representation must be an interior-mutable field.

This make interrupt sources similar to a Cell<*mut IRQState>.  However,
a Cell can only live within one thread, while here the semantics are
"accessible by multiple threads but only under the Big QEMU Lock".

Therefore, this series adds to QEMU a specialized cell type that checks
locking rules with respect to the "Big QEMU Lock".  In particular,
qemu_api::cell::BqlCell only allows get()/set() under BQL protection and
therefore is Send/Sync.  The code for BqlCell is a bit long but most of
it is lifted from the standard library and almost half is documentation,
including doctests.

Likewise, qemu_api::cell::RefCell would be a RefCell that is Send/Sync,
because it checks that borrow()/borrow_mut() is only done under BQL.
This is not added here because there is no use case (yet), but Zhao
is going to use it for his HPET implementation.

I am not fully satisfied with the solution I used for mocking the BQL;
I have a prototype that runs doctests from "meson test" but that may be
better left to Meson itself.

Paolo

v1->v2:
- change debug_assert to assert
- clarify meaning of active-high
- allow declaring vectored interrupt source
- fix documentation wrt threading rules

Paolo Bonzini (2):
  rust: add BQL-enforcing Cell variant
  rust: add bindings for interrupt sources

 rust/hw/char/pl011/src/device.rs |  22 +--
 rust/qemu-api/meson.build        |   3 +
 rust/qemu-api/src/cell.rs        | 298 +++++++++++++++++++++++++++++++
 rust/qemu-api/src/irq.rs         |  91 ++++++++++
 rust/qemu-api/src/lib.rs         |   3 +
 rust/qemu-api/src/sysbus.rs      |  26 +++
 6 files changed, 433 insertions(+), 10 deletions(-)
 create mode 100644 rust/qemu-api/src/cell.rs
 create mode 100644 rust/qemu-api/src/irq.rs
 create mode 100644 rust/qemu-api/src/sysbus.rs

-- 
2.47.0


