Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uAnYP-0001AQ-9T
	for mharc-qemu-rust@gnu.org; Fri, 02 May 2025 06:23:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uAnYN-00019U-7U
 for qemu-rust@nongnu.org; Fri, 02 May 2025 06:23:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uAnYI-0000eL-R4
 for qemu-rust@nongnu.org; Fri, 02 May 2025 06:23:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746181409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5rvgreZ2Tdp5oI4LAiAg7hrQ25Lx1obBO7Gvzs+5dQ8=;
 b=FNuwioWMVl32QuTOO18renT59/HT+9wHb8JBznBQAtH5ml8oG2dDrwOiZ/KXYOI2B/riKE
 flL3v3Tq8h6xgvr3IS6U2Wz4yz4y/y8/dh+e7azsI/7ybTudAtJZfBAtZVlY3xRm/17d2h
 pOPPHhftiqleegX/ir0McafZH3cIWbQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-34-jGKhF2VLPg-JbuHdwpZHRA-1; Fri, 02 May 2025 06:23:27 -0400
X-MC-Unique: jGKhF2VLPg-JbuHdwpZHRA-1
X-Mimecast-MFC-AGG-ID: jGKhF2VLPg-JbuHdwpZHRA_1746181406
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43cfda30a3cso7871805e9.3
 for <qemu-rust@nongnu.org>; Fri, 02 May 2025 03:23:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746181406; x=1746786206;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5rvgreZ2Tdp5oI4LAiAg7hrQ25Lx1obBO7Gvzs+5dQ8=;
 b=OPNmZWKQYJPRePGptc41/7DXd0+L7YAVCkW+evrgon1BH4gEXEhN+rYlzPz68sNGTJ
 16U5MN4LTBzCCD2mqFbmlvGjb67BG4teTsoUVm6kzEslpZahPCh538AIXcVaKh1M2pri
 yfmiN5LxwlGAmx4ibuovWfeci/9EGgi1+OaQPgwyKD+6CNZofvzc7qB5ETPvaQQTjPrG
 Pz4abyn7DKIYwI4/mlFhvUt3v2grzDoSPloPLzUEUYT/cxtplIaZHX4YRAJtcuzuPU2l
 1hNTKATWWbxOnU19kGtjt5RviDq2gE5Vo9fZmHx7QiFC7ecv1Dj2EaDC7binBwaCV5ko
 JLlg==
X-Gm-Message-State: AOJu0YyuD7DNZlqy7rPwLXoSdQU4EKCe8QRK0fcUqYZzrpDbA7/HaZ1O
 QLTxBsMQkBWfKZFXg1PBnza8baGY4oin/nsuQO5K5q7H+EtGJ1nzJZPCGCuDLfi+w+IfChkEttC
 hpJfAlzL6sb+WvNN9jRPMl26TghMEpuszfZQKKtGONJFkGxntG18MkDIcaAM=
X-Gm-Gg: ASbGnctrrPpb9/f68Zdrfm0dBFwYJbLW15lD5XaYoCHpJRDDGxttuedKu86dhGr8hIG
 zPIsLSimjYYbpCoIJJLU+bfldX9p1Ma7bcCGMfV350pWuGl4y25DmQX888ugnz8skOJDoYtBoA4
 6tsR6wDC9eAXRgDEQZyBLcpjarHhSz18FVrZpk7lGJINmXsbYZpPgpt/2oO7q3+hhobHOo6EI1V
 CF7x2FkVrsklcPMUAas3c8eDmJrr2hazS3tpEO9E0tbQtwYGkUuD1fEoRewe/N1XMrIRR5O40hI
 uvJ6BmWf7JC/ZGc=
X-Received: by 2002:a05:600c:c0f:b0:43c:fd27:a216 with SMTP id
 5b1f17b1804b1-441bbf2b794mr17793985e9.23.1746181405984; 
 Fri, 02 May 2025 03:23:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGbNPA3xMEhv8JQF64TWortAqmKr7PV6+0hRGfLlnkPLVIItLG4plUCPAA5Y+UMpDE1zbvHQ==
X-Received: by 2002:a05:600c:c0f:b0:43c:fd27:a216 with SMTP id
 5b1f17b1804b1-441bbf2b794mr17793845e9.23.1746181405649; 
 Fri, 02 May 2025 03:23:25 -0700 (PDT)
Received: from [192.168.10.48] ([151.95.54.106])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b8a31576sm39380915e9.37.2025.05.02.03.23.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 03:23:24 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 0/9] rust: allow minimum version of 1.77
Date: Fri,  2 May 2025 12:23:13 +0200
Message-ID: <20250502102323.104815-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: saUqfPIO5_nvA-NbVYsAbLneNIDDFStoLsNyua9hBV8_1746181406
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.644,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-List-Received-Date: Fri, 02 May 2025 10:23:35 -0000

Debian bookworm provides Rust 1.78 on all architectures except for mips64el,
as part of its packaging of Firefox.  Michael Tokarev confirmed that
it is not a problem at this point to require a rustup-based toolchain
when building for mips64el on bookworm.

This series therefore updates the minimum supported Rust version
to 1.77 (since 1.78 does not really add anything that QEMU needs).
It removes several temporary compatibility shims (including offset_of)
and enables the introduction of some more modern idioms, for example
cast_const()/cast_mut() and "let ... else".  These were useful as early
experiments with procedural macros and with supporting old versions of
Rust, but are not needed anymore.

The remaining major obstacle is const_refs_static, which was stabilized
in 1.83.0 and allows for much-improved vmstate bindings.  These were
prototyped by Zhao and myself and I'll post them shortly for reference.
It's unlikely that Debian bookworm will update rustc-web any further,
since the next Firefox ESR version is expected roughly at the same time
as the Debian trixie release.

Paolo

Paolo Bonzini (9):
  lcitool: use Rust 1.78 for Debian bookworm
  rust: use std::ffi instead of std::os::raw
  rust: let bilge use "let ... else"
  rust: qemu_api_macros: use "let ... else"
  rust: use MaybeUninit::zeroed() in const context
  rust: remove offset_of replacement
  rust: replace c_str! with c"" literals
  rust: enable clippy::ptr_cast_constness
  docs: rust: update for newer minimum supported version

 docs/about/build-platforms.rst                |   7 +-
 docs/devel/rust.rst                           |  38 +---
 rust/Cargo.lock                               |   1 -
 rust/Cargo.toml                               |   4 +-
 rust/clippy.toml                              |   2 +-
 rust/hw/char/pl011/Cargo.toml                 |   2 +-
 rust/hw/char/pl011/src/device.rs              |   4 +-
 rust/hw/char/pl011/src/device_class.rs        |  13 +-
 rust/hw/char/pl011/src/lib.rs                 |   6 +-
 rust/hw/timer/hpet/Cargo.toml                 |   2 +-
 rust/hw/timer/hpet/src/fw_cfg.rs              |   6 +-
 rust/hw/timer/hpet/src/hpet.rs                |  28 ++-
 rust/hw/timer/hpet/src/lib.rs                 |   4 +-
 rust/qemu-api-macros/Cargo.toml               |   2 +-
 rust/qemu-api-macros/src/lib.rs               | 113 +++++-------
 rust/qemu-api/Cargo.toml                      |   5 +-
 rust/qemu-api/build.rs                        |   7 -
 rust/qemu-api/meson.build                     |   5 -
 rust/qemu-api/src/c_str.rs                    |  61 -------
 rust/qemu-api/src/cell.rs                     |   6 +-
 rust/qemu-api/src/chardev.rs                  |   5 +-
 rust/qemu-api/src/irq.rs                      |   6 +-
 rust/qemu-api/src/lib.rs                      |   7 +-
 rust/qemu-api/src/memory.rs                   |   3 +-
 rust/qemu-api/src/offset_of.rs                | 168 ------------------
 rust/qemu-api/src/qdev.rs                     |   9 +-
 rust/qemu-api/src/qom.rs                      |   7 +-
 rust/qemu-api/src/timer.rs                    |   4 +-
 rust/qemu-api/src/vmstate.rs                  |  14 +-
 rust/qemu-api/src/zeroable.rs                 | 104 ++---------
 rust/qemu-api/tests/tests.rs                  |  11 +-
 rust/qemu-api/tests/vmstate_tests.rs          |  27 +--
 subprojects/bilge-impl-0.2-rs.wrap            |   2 -
 .../packagefiles/bilge-impl-1.63.0.patch      |  45 -----
 tests/lcitool/mappings.yml                    |   3 +
 35 files changed, 146 insertions(+), 585 deletions(-)
 delete mode 100644 rust/qemu-api/src/c_str.rs
 delete mode 100644 rust/qemu-api/src/offset_of.rs
 delete mode 100644 subprojects/packagefiles/bilge-impl-1.63.0.patch

-- 
2.49.0


