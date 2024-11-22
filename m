Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tEOOc-00056v-Np
	for mharc-qemu-rust@gnu.org; Fri, 22 Nov 2024 02:48:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tEOOa-00056b-Nn
 for qemu-rust@nongnu.org; Fri, 22 Nov 2024 02:48:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tEOOY-0003OW-MX
 for qemu-rust@nongnu.org; Fri, 22 Nov 2024 02:48:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732261680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6bOTsY7bya2Tl46qnI16BZyl6bMSIUCIWNqzd/uE6UU=;
 b=ZMb5zabrYkEIT8XU2VbhJ7Klfy+SVNcS/yQ8nXRXuc+s05KNMEkSPzpLci81OAPZH1gavB
 2Qdlw1HzVnhv2dV7w3I9nev21j1OYOxcBQ3P9mE/YN3bxFCDpKqiHSGHEtsyqWPoPMpt35
 BZMYuavE2SN7YKwTL2vYKsDYdgWc2KY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-Y1ScogDPPQO9sSXi69Iqyw-1; Fri, 22 Nov 2024 02:47:59 -0500
X-MC-Unique: Y1ScogDPPQO9sSXi69Iqyw-1
X-Mimecast-MFC-AGG-ID: Y1ScogDPPQO9sSXi69Iqyw
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-38249bf9e82so840986f8f.2
 for <qemu-rust@nongnu.org>; Thu, 21 Nov 2024 23:47:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732261678; x=1732866478;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6bOTsY7bya2Tl46qnI16BZyl6bMSIUCIWNqzd/uE6UU=;
 b=RmxU4Rc9859s0d2ZINmtycrpqpx3qVJGWVwUfd+j9XXv5CLpT0eryfr1jwBopF1gFn
 zpvoI2aAQh8d2KZKiwNZc8WScUw18BKdCBvv/GlEG8c9zmBwmVMWhBFOzwm5isTP0rGk
 BCVJQBAJ1Xv0VatC4HeKZN4/OpE0KHzkB/KYE00sZlZkmeVlNvxGHw7PsHDg7rsWkzhh
 T2c2UeMSfWguCwua/dXE/uDjtKuxhcqrSoFAiIkZZjBduzbSeauX1OB/+bbpo9fO7Lzf
 C2NG3vVBaUFOg4o9GWmN4arFV/K8Fd5yDcRnAzy9Wb6ovCew+lG5K26PXJ6AyxMOVU0I
 dMMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhYXGZw8XdI08tLtASBl+zLlvGK3FFhK12tVAcl5O9kDpYrZlJFpZ7kZgAhnZD15xNqqYXokbjexA=@nongnu.org
X-Gm-Message-State: AOJu0YzNx0wUEBNVIPWSonP7MxFVZkCDKxqZbg+8TxHeBWZY5cOncq/r
 cJlXtZ5pbIZCWseiftggxpqTYQrBb04gSj426xTpPbdOjDXjeJ366C8w7uPavYWh4maMmYrevAb
 UxrBSKfongcoGn5SvVZb3k2xZKbHq39ri4sMw3so+MiawqiZ9c6o=
X-Gm-Gg: ASbGncvefSMEiHv+a0nkIokkv9D/P+Rl4fhUBLQxqtDuzzGotCV7l32+ED1yg66dpAC
 YA/+64MNAe7Kkit256C/54d7YjbEYnV/CChzMVS+x7AoPsHndyqDvvMmSEL6wPzPt142GU5xYmp
 1nLaWPliMEhQulqTNavEY5oBZFQeuWKb/nUJm5pOGRfrT0t/amQmalH6Pv3IJyUg9JjuwfSpIRg
 FOwW6IgWmqN9Ud18XT2L72XHVmX49df/uznxrR3cJ+bU7PdR2Vr6Q==
X-Received: by 2002:a05:6000:18ac:b0:37c:d1bc:2666 with SMTP id
 ffacd0b85a97d-38260b502dcmr1459579f8f.4.1732261678153; 
 Thu, 21 Nov 2024 23:47:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEIWEOmbM7/QP9wjrlRul43Jb8S3MU9ctVgLtPfFhq2y/5gq7NyIVUq6/Vrep2S9DcE7a+62Q==
X-Received: by 2002:a05:6000:18ac:b0:37c:d1bc:2666 with SMTP id
 ffacd0b85a97d-38260b502dcmr1459568f8f.4.1732261677784; 
 Thu, 21 Nov 2024 23:47:57 -0800 (PST)
Received: from [192.168.10.3] ([151.49.204.250])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fbc4173sm1708062f8f.72.2024.11.21.23.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 23:47:57 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: junjie.mao@hotmail.com,
	zhao1.liu@intel.com,
	qemu-rust@nongnu.org
Subject: [PATCH 0/2] rust: safe wrappers for interrupt sources
Date: Fri, 22 Nov 2024 08:47:54 +0100
Message-ID: <20241122074756.282142-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ei_Hra38anzKomjQpPBb6o2r5fdUNXURO_V5LGvaguY_1732261678
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.14,
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
X-List-Received-Date: Fri, 22 Nov 2024 07:48:04 -0000

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
therefore is Send/Sync.  It comes with documentation and doctests.
I am not fully satisfied with the solution I used for mocking the BQL;
I have a prototype that runs doctests from "meson test" but that may
take some more time to cook.

Likewise, qemu_api::cell::RefCell would be a RefCell that is Send/Sync,
because it checks that borrow()/borrow_mut() is only done under BQL;
but this is not added here because there is no use case (yet).

The interrupt sources prat was previously posted as RFC at
https://lore.kernel.org/qemu-devel/20241104085159.76841-1-pbonzini@redhat.com/,
while the BqlCell is new.  The code is a bit long but most of it is
lifted from the standard library and almost half is documentation.

Please review!

Paolo Bonzini (2):
  rust: add BQL-enforcing Cell variant
  rust: add bindings for interrupt sources

 rust/hw/char/pl011/src/device.rs |  22 +--
 rust/qemu-api/meson.build        |   3 +
 rust/qemu-api/src/cell.rs        | 294 +++++++++++++++++++++++++++++++
 rust/qemu-api/src/irq.rs         |  66 +++++++
 rust/qemu-api/src/lib.rs         |   3 +
 rust/qemu-api/src/sysbus.rs      |  26 +++
 6 files changed, 404 insertions(+), 10 deletions(-)
 create mode 100644 rust/qemu-api/src/cell.rs
 create mode 100644 rust/qemu-api/src/irq.rs
 create mode 100644 rust/qemu-api/src/sysbus.rs

-- 
2.47.0


