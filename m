Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uBsky-0005N6-DG
	for mharc-qemu-rust@gnu.org; Mon, 05 May 2025 06:09:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uBskw-0005K6-NT
 for qemu-rust@nongnu.org; Mon, 05 May 2025 06:09:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uBsku-0007BR-6q
 for qemu-rust@nongnu.org; Mon, 05 May 2025 06:09:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746439739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mo6VTAvR/T9wtlPyBhOf4b3ONNglD/nqFYKB9OjuyRo=;
 b=IGIL2njxV36QfiwCzTC+AkKUewrakMfFgJyNRvITzsfcLRF8dW+ohve4n34xHPMmtPEwYG
 h0dU7YWoe8aiD0H6yz/AdhG5xua/8mDObMAZO2+heImWDItrLuG2Z1pk7fplGKULbNV4jV
 W6aKZq2oxgAPMH59SHGN2uNEop3vvJA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-180-_-wKOX2XNXuN7GEGqAY_XQ-1; Mon, 05 May 2025 06:08:58 -0400
X-MC-Unique: _-wKOX2XNXuN7GEGqAY_XQ-1
X-Mimecast-MFC-AGG-ID: _-wKOX2XNXuN7GEGqAY_XQ_1746439737
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43f251dc364so23994575e9.2
 for <qemu-rust@nongnu.org>; Mon, 05 May 2025 03:08:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746439736; x=1747044536;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mo6VTAvR/T9wtlPyBhOf4b3ONNglD/nqFYKB9OjuyRo=;
 b=vSXRHes6ZCKZaI+Xr5y0bx7Y7cOS3qsckXwerfSKtnkQ+2HK3CPB8J8GMcf2YSXrj4
 ctxqu//MGKK4NMlY1uAYAEDBxXd4nNV/WfOqDSOw/Z1UeGPUAs97vyA/atu3u+rcmT3V
 SHolHNJKqWTRo4PdmUEn451WA6oNuxDxnBSwThjNNxQhk4AF0ambQDgb4IC5FbKKBSvm
 EX8Eme43bZ06OOMSFSSlckx3o/+UAiP1oqiJaX/j6BbSJ/R4jjH/47NOuWgM/h6YpO5l
 a0vrl3iUaFBxzMK7oR+LuzlROGwUiomCPGhP6mt8u/HmESd6llUo1l0Y2FsXa29WCEGQ
 aeGA==
X-Gm-Message-State: AOJu0YzASIw8B0G0smpMAKo0NZsFFgIgHd29K1eLSLgr3ONzmOwUQ6HT
 ZkPxbX6Ft4sKmaFOFkdIvz3JeGcXD2b/dQ16ILhJBRePAJVZ7M1fT5W9lng1t1c9NETL+ULlK2x
 j2V4HeiGj0RxUemKRxbOJEg8iJuZL+VypNFPWiSK+S03zb3wVToFD6Ijgeqg=
X-Gm-Gg: ASbGncuuf3VAmPlIJ20Fto/tl3GdMrNMXuzH49hN3K65C0RrcxMAKeOjXZBM3slRfYK
 v+wAwUhsSHn3Em8cFiVUxPUGCYIdLW2UwIoOnL5cE5qwTGvMGs576EjS8HPis48ycGq1mKNALEd
 OVEFiPI4pDPecpfHAOM41SVoThOz2BTfvDZXNa/ZC3kKy4ibxIeBJWPy9iuBfVEZZ1aS2RSSbzh
 83Xt7qeaD76Zd4ZVtHdG1jS5zB+UaQf/a/3pIjT6HJYbmFIGhcWmaQhqotI8rYXsHHHfTkJQhPD
 YBNZgHmAh45LMDE=
X-Received: by 2002:a05:6000:1a86:b0:39a:c8a8:4fdc with SMTP id
 ffacd0b85a97d-3a09fd748a2mr5434730f8f.16.1746439736606; 
 Mon, 05 May 2025 03:08:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmrEjlsgIrPyvig3b24aLxAf+x6R1gNsAKigw2FTA63NlpLi/uRqJVDUTyyvJBYmVrrGbQ3w==
X-Received: by 2002:a05:6000:1a86:b0:39a:c8a8:4fdc with SMTP id
 ffacd0b85a97d-3a09fd748a2mr5434710f8f.16.1746439736179; 
 Mon, 05 May 2025 03:08:56 -0700 (PDT)
Received: from [192.168.10.48] ([151.95.54.106])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a099b0ff5asm9947256f8f.75.2025.05.05.03.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 May 2025 03:08:55 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH preview 0/5] rust: allow minimum version of 1.83
Date: Mon,  5 May 2025 12:08:49 +0200
Message-ID: <20250505100854.73936-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7aoo17ifQ3NGlWRTUfzq5JnZlFFlSLnU4sMnWZ4SwV8_1746439737
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.411,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
X-List-Received-Date: Mon, 05 May 2025 10:09:03 -0000

This is the preview of moving the minimum supported Rust version
forward to 1.83.0, which is the target for QEMU due to its support
for the const_refs_to_static feature.

Being able to autogenerate all the reflection-like structs in qdev and
VMState improves the type safety, but also requires annotating the
types with the information needed to generate the structs.  The
const_refs_to_static feature is needed because this information resides
in constants that refer to global variables (of types such as PropertyInfo,
VMStateField or VMStateDescription).

This series does not cover enabling the newer compiler in CI because,
while both Debian and Ubuntu have a new-enough Rust compiler to support
1.77, they pose problems for this further bump.  For Debian, the bookworm
release probably will not have new compilers and is supported by QEMU
for roughly two more years.  For Ubuntu, the situation is a bit weird
because while Ubuntu 22.04 had new Rust compilers added until the summer
of 2024, Ubuntu 24.04 is not adding packages for new versions.

A possible plan here is to split the configuration between "enable Rust"
and "enable all devices written in Rust" as soon as new devices are
contributed that are written in Rust.  This way, the C versions of
the pl011 and HPET devices can be used but the new boards/devices would
only be available on Debian or Ubuntu by using rustup.

This series does not use *all* features enabled between 1.77 and 1.83;
in particular it does not replace addr_of!/addr_of_mut! with "&raw"
expressions.

Paolo

Paolo Bonzini (5):
  meson, cargo: require Rust 1.83.0
  rust: use inline const expressions
  rust: vmstate: convert to use builder pattern
  rust: vmstate: use const_refs_to_static
  rust: qdev: const_refs_to_static

 docs/devel/rust.rst                    |  30 +-
 meson.build                            |   6 +-
 rust/Cargo.toml                        |   2 +-
 rust/clippy.toml                       |   2 +-
 rust/hw/char/pl011/src/device.rs       |  20 +-
 rust/hw/char/pl011/src/device_class.rs | 123 +++----
 rust/hw/timer/hpet/src/hpet.rs         | 173 ++++------
 rust/qemu-api/src/assertions.rs        |   4 -
 rust/qemu-api/src/callbacks.rs         |  27 +-
 rust/qemu-api/src/chardev.rs           |   2 +-
 rust/qemu-api/src/qdev.rs              |  16 +-
 rust/qemu-api/src/timer.rs             |   2 +-
 rust/qemu-api/src/vmstate.rs           | 432 +++++++++++++++----------
 rust/qemu-api/tests/tests.rs           |  20 +-
 rust/qemu-api/tests/vmstate_tests.rs   | 155 +++++----
 15 files changed, 517 insertions(+), 497 deletions(-)

-- 
2.49.0


