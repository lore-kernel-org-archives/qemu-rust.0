Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tFU5x-0004mw-HI
	for mharc-qemu-rust@gnu.org; Mon, 25 Nov 2024 03:05:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tFU5u-0004mB-VP
 for qemu-rust@nongnu.org; Mon, 25 Nov 2024 03:05:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tFU5t-0007Go-2Q
 for qemu-rust@nongnu.org; Mon, 25 Nov 2024 03:05:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732521913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Bw+iN8fKxiF3pJPEF1ZMN/bkTyNEV3JjeMKpd70KM5M=;
 b=UlLZwfIRZGrSiWWagEUEOaSNe33B/sCyrufP8EzG+kLW4M1x29VydiiCXdoYXaRm0GqCtd
 PPDbW3Lbrd678ClA2tv0x37LHFZslzEHxtTKHZlV6RDY3vW93JsWnT1QH2xreRIy+LozDL
 u+xXIgYTUTkBEfBA6Aq/cT1+H13Hsyw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-502-Do7zExq5NDeCaFP3kJczPA-1; Mon, 25 Nov 2024 03:05:11 -0500
X-MC-Unique: Do7zExq5NDeCaFP3kJczPA-1
X-Mimecast-MFC-AGG-ID: Do7zExq5NDeCaFP3kJczPA
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4349d895ef8so9841455e9.0
 for <qemu-rust@nongnu.org>; Mon, 25 Nov 2024 00:05:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732521910; x=1733126710;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Bw+iN8fKxiF3pJPEF1ZMN/bkTyNEV3JjeMKpd70KM5M=;
 b=NLabk2IfbJC7Uk0pzzRXKqMyK15fqjaxUh/uPYeyZv5DFgMN3NbrUDObY1prTHtjG1
 WHtuU90JCBk8CDDE7EpQMT2QRDpIwjPt6ZPdtHdzphsoGYhQRSWkzZuvielxVaGxvLSr
 UcbmAEicVYFxLJhYG2+jJGWcL+4s3oX996r/m4pYz7tAL7k4vTTgQ+vRRDYTOq8Y3XJc
 2vXzJwvGjBktvZznW7v4yXQulEkGDnZFwFDF0mLO7km+nf8w7skbBNRQGcwLGi2Ox742
 Vi+pK4pjChdk3SrzuFvHgDM/mkrg2iUAIfHOOLh13RkLW7rq3WYGnVPR6ZvVVJEQxcE6
 7zOA==
X-Gm-Message-State: AOJu0Yy9eVSxbitL4fuMKR4PqXz3FXr64epcoEftMo0nBL1Anh3iLO2Q
 nwubcjjxU7SYMSoPatnVCGzVZGIbeW7FrMl9iaiildlyE7TQxeJ76DVqQHBxfptFZk78rizE15j
 tJNFKCBRqth2UwCOCMR85pRHBEgQpcMMxCGcRJdBDBE8y6nQ6IRE=
X-Gm-Gg: ASbGncsKw/AM341v3OYu8eLg0NmdjKYAX6ZASL00c6Ya5J6XeSxtJTNDXzHay9cxNbF
 pTlELTrnbDKhN2B/3eovNHogWXzco4DMsQpHarQWbt1YTJ2nhY/RGGLEmyhbvdcnn3rcWPYJT2a
 QoyCT0DRvx7rmBABtBgmDTHsnmvfV3XhF4vr92LM1Yfylu4uFjTgC7PEPEZnj3IsMzkoWr4aA4v
 6qi8kxqTxfl3xGOJtDwy3b06nrXikGC4daN9AsJbnTavp/LML6OV6A=
X-Received: by 2002:a05:600c:4fcc:b0:42c:ba83:3f00 with SMTP id
 5b1f17b1804b1-433ce410337mr105830785e9.1.1732521910015; 
 Mon, 25 Nov 2024 00:05:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1zBCfDrGIynB2ASOwAQjAJVdBuUepbytkFetSs2xQwWRCpw2J8N5+BIUNDD8lv6ehM+P6Kw==
X-Received: by 2002:a05:600c:4fcc:b0:42c:ba83:3f00 with SMTP id
 5b1f17b1804b1-433ce410337mr105830325e9.1.1732521909421; 
 Mon, 25 Nov 2024 00:05:09 -0800 (PST)
Received: from [192.168.10.47] ([151.49.236.146])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4349f2e1b3bsm32303775e9.25.2024.11.25.00.05.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2024 00:05:08 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 0/8] rust: qom: move bridge for TypeInfo and DeviceClass
 functions to common code
Date: Mon, 25 Nov 2024 09:04:59 +0100
Message-ID: <20241125080507.115450-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vLGY-smB0yOzjsO_lqWlB6z7iLzC7f9-XNGmC_oDSWQ_1732521910
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
X-List-Received-Date: Mon, 25 Nov 2024 08:05:19 -0000

This is a first step towards modeling QOM in the Rust type system.
This is by no means the final state of the bindings; rather, the
one thing it focuses on is moving unsafe code out of devices.  This
in principle removes code duplication, though with only one device
the duplication is still theoretical.

In particular the pl011 device includes bridge functions for instance_init,
DeviceClass::realize and DeviceClass::unrealize that take raw pointers
and call to (usually safe, though not always) functions that take Rust
references.

These functions would be the same for all devices; parameterize them on
a generic type, so that the implementation of TypeInfo.class_init can
reuse them.  Likewise implement TypeInfo.instance_finalize simply as
std::ptr::drop_in_place, which automatically bridges to the Drop trait
if the class implements it.

Some of the traits resemble those in Manos's implementation at
https://lore.kernel.org/qemu-devel/20241024-rust-round-2-v1-3-051e7a25b978@linaro.org/;
in particular DeviceImpl is an extension of his same-named trait, also
covering properties and vmstate, and ClassInitImpl for now is the same
as his ClassImplUnsafe.  I have not added an explicit "Unsafe" suffix
because I don't plan to have separate safe and unsafe versions of the
traits, just like there is no DeviceImplUnsafe.  The main difference
lies in the usage of generics and monomorphization over macros;
generics are always compiled and any compiler error messages point
at the implementation rather than the invocation of the macro.

While at it, the series starts adding documentation to the QOM machinery.
A lot of the extra lines of code in fact is documentation and/or safety
comments.

Paolo

Paolo Bonzini (8):
  rust: qom: add default definitions for ObjectImpl
  rust: qom: rename Class trait to ClassInitImpl
  rust: qom: convert type_info! macro to an associated const
  rust: qom: move ClassInitImpl to the instance side
  rust: qdev: move device_class_init! body to generic function,
    ClassInitImpl implementation to macro
  rust: qdev: move bridge for realize and reset functions out of pl011
  rust: qom: automatically use Drop trait to implement instance_finalize
  rust: qom: move bridge for TypeInfo functions out of pl011

 rust/hw/char/pl011/src/device.rs       |  85 ++++++---------
 rust/hw/char/pl011/src/device_class.rs |  34 ------
 rust/qemu-api/src/definitions.rs       | 140 ++++++++++++++++++-------
 rust/qemu-api/src/device_class.rs      | 114 +++++++++++++++++---
 rust/qemu-api/tests/tests.rs           |  33 +++---
 5 files changed, 246 insertions(+), 160 deletions(-)

-- 
2.47.0


