Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uBrkp-0003Vg-46
	for mharc-qemu-rust@gnu.org; Mon, 05 May 2025 05:04:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uBrkn-0003VO-RW
 for qemu-rust@nongnu.org; Mon, 05 May 2025 05:04:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uBrki-0005if-Uc
 for qemu-rust@nongnu.org; Mon, 05 May 2025 05:04:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746435882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dksCS6LKuaicdjjEJleqr/EG/BZ6HAqmg1yjeO9ZiYw=;
 b=dDakDnlSsTBLPkCm9Nq9vhrgO2uBSFzJNsXbkOIjktz+eTY9DQZ7ay3P80SVppnGiKN2UQ
 XuMUgdfPIP0JKnxprc2h2cAQgV3lzpYC73T1AwDueD2U22gYp3+EkJkavQeVarWQJmLULV
 1N8GaZz77ujTRQXujDz6/VjEhWhJO+M=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-jXOjivhYOjeEfBAH0kVhPA-1; Mon, 05 May 2025 05:04:41 -0400
X-MC-Unique: jXOjivhYOjeEfBAH0kVhPA-1
X-Mimecast-MFC-AGG-ID: jXOjivhYOjeEfBAH0kVhPA_1746435880
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3912fe32a30so1171420f8f.1
 for <qemu-rust@nongnu.org>; Mon, 05 May 2025 02:04:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746435880; x=1747040680;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dksCS6LKuaicdjjEJleqr/EG/BZ6HAqmg1yjeO9ZiYw=;
 b=Ao0E8l3/DlyNPrxrKKhmcNA0YgKh4rA9FC1iGpNbJ9bUbbo/22PtQsf8nmxehELkm0
 7FXSVrlc6B6QS1uKwMwIOQ2zq7P5lJSW7Eq66icdRUSYn+x02W3J/DgHXUqO2R3VzrNN
 SZslNCoH7+LS0zpnKvc9cU1ZcK9ZcWsSpvjz7L61jpeeRNhLkGKDerqo4udQif2D0vqc
 GU35mU/Wh1v73D+FA4bFzOlwLNUlXjJgud1oJy4jP5OuHRHUjgsvrFZDhzL7SBxpJl3x
 lHQnWRBlNC6ApFUE+gFejcwbg5IRH3rAwxxobJmxmOfir6iGyyizg1I5Nihz6kCCO0zp
 UCyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/GzCVjD96Da8kXuB84Q598gwL5tZLOafxuBGg3VptkmFg19tlwfFtL76FMle4NcwlLDNtWFsK2zg=@nongnu.org
X-Gm-Message-State: AOJu0YyRAdMIxRZS82pmkIkwqim7z+KOP+oBY+Bgxfxyx81NsZQXfl62
 ziIxF+ZL2QKiSlG8DBDvkwJbioeI7FpoibJI03il/Xt35fnuYetLS7trsN2Iqiw+k/eCdiBwvsE
 3YLXzLL7y0CkLz1ziP5jbYU7gAAwVByMqCFQUtfo6LsJMFB3yW1M=
X-Gm-Gg: ASbGncsYTPdt9OStVyBbdZNz536qiv14pGcn8Br46sEeTe5riKVzxy99duF0S6dDF1q
 D7Zc2/2j7H4YhUWg71YmXV1VyVnZ4z7x9DiEKpAAI4qW69TwvX9gbwDx5AhfzmU1Og740FUuhIS
 f7AZ65r3m9zNe1MpWqdo7+6rypgUyMe/t5tMFnZF2W5cevpqHM5/Vkv1oGpKBhjL6ej8pxYvpJ7
 SWW9yUgIpHGZMgYChQazxVT3Le+pIRV5rAbQHi1s4dYgtPnW0n61XqA5fZl/EnMy4fGXfVHVSA0
 Xv0VeLNZXg2350w=
X-Received: by 2002:a05:6000:2ce:b0:39c:1ef6:4364 with SMTP id
 ffacd0b85a97d-3a099ad5c8cmr9522341f8f.14.1746435880240; 
 Mon, 05 May 2025 02:04:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHT21cscqIxs5DbKCW13o7JZglNTBudf/YZcP8bpydBSYmcT2OsPV0SRuCKrAA9shod9RIPZg==
X-Received: by 2002:a05:6000:2ce:b0:39c:1ef6:4364 with SMTP id
 ffacd0b85a97d-3a099ad5c8cmr9522320f8f.14.1746435879906; 
 Mon, 05 May 2025 02:04:39 -0700 (PDT)
Received: from [192.168.10.48] ([151.95.54.106])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a099ae0c3dsm10039730f8f.12.2025.05.05.02.04.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 May 2025 02:04:39 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: manos.pitsidianakis@linaro.org,
	qemu-rust@nongnu.org
Subject: [PATCH 00/11] rust: allow minimum version of 1.77
Date: Mon,  5 May 2025 11:04:25 +0200
Message-ID: <20250505090438.24992-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZongEY71hspkunkb0zWLnDFd1rvQoAJh71QRDy2Gns0_1746435880
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
X-List-Received-Date: Mon, 05 May 2025 09:04:50 -0000

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

v1->v2:
* rebase on top of "rust: centralize config in workspace root"
* also adjust Dockerfile for Ubuntu 22.04
* extract separate patch to require Rust 1.77.0 in Meson and Cargo
* fix TODO about zeroability of classes
* use "let ... else" more (and better) in qemu_api_macros
* run everything through rustfmt
* place ptr_cast_constness patch earlier, since cast_mut()/cast_const()
  were introduced before offset_of and c"" literals

Paolo Bonzini (11):
  lcitool: use newer Rust for Debian and Ubuntu
  meson, cargo: require Rust 1.77.0
  rust: use std::ffi instead of std::os::raw
  rust: let bilge use "let ... else"
  rust: qemu_api_macros: make pattern matching more readable and
    efficient
  rust: use MaybeUninit::zeroed() in const context
  rust: qom: fix TODO about zeroability of classes
  rust: enable clippy::ptr_cast_constness
  rust: remove offset_of replacement
  rust: replace c_str! with c"" literals
  docs: rust: update for newer minimum supported version

 docs/about/build-platforms.rst                |  11 +-
 docs/devel/rust.rst                           |  38 +---
 meson.build                                   |   6 +-
 rust/Cargo.lock                               |   1 -
 rust/Cargo.toml                               |   6 +-
 rust/clippy.toml                              |   2 +-
 rust/hw/char/pl011/src/device.rs              |   4 +-
 rust/hw/char/pl011/src/device_class.rs        |  13 +-
 rust/hw/char/pl011/src/lib.rs                 |   6 +-
 rust/hw/timer/hpet/src/fw_cfg.rs              |   6 +-
 rust/hw/timer/hpet/src/hpet.rs                |  28 ++-
 rust/hw/timer/hpet/src/lib.rs                 |   4 +-
 rust/qemu-api-macros/src/lib.rs               | 113 ++++--------
 rust/qemu-api/Cargo.toml                      |   3 -
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
 rust/qemu-api/src/qom.rs                      |  14 +-
 rust/qemu-api/src/timer.rs                    |   4 +-
 rust/qemu-api/src/vmstate.rs                  |  14 +-
 rust/qemu-api/src/zeroable.rs                 | 104 ++---------
 rust/qemu-api/tests/tests.rs                  |  11 +-
 rust/qemu-api/tests/vmstate_tests.rs          |  27 +--
 .../ci/setup/ubuntu/ubuntu-2204-aarch64.yaml  |   2 +-
 .../ci/setup/ubuntu/ubuntu-2204-s390x.yaml    |   2 +-
 subprojects/bilge-impl-0.2-rs.wrap            |   1 -
 .../packagefiles/bilge-impl-1.63.0.patch      |  45 -----
 .../dockerfiles/debian-amd64-cross.docker     |   2 +-
 .../dockerfiles/debian-arm64-cross.docker     |   2 +-
 .../dockerfiles/debian-armhf-cross.docker     |   2 +-
 .../dockerfiles/debian-i686-cross.docker      |   2 +-
 .../dockerfiles/debian-mips64el-cross.docker  |   2 +-
 .../dockerfiles/debian-mipsel-cross.docker    |   2 +-
 .../dockerfiles/debian-ppc64el-cross.docker   |   2 +-
 .../dockerfiles/debian-s390x-cross.docker     |   2 +-
 tests/docker/dockerfiles/debian.docker        |   2 +-
 tests/docker/dockerfiles/ubuntu2204.docker    |   3 +-
 tests/lcitool/mappings.yml                    |   5 +
 tests/lcitool/refresh                         |   5 +-
 46 files changed, 169 insertions(+), 604 deletions(-)
 delete mode 100644 rust/qemu-api/src/c_str.rs
 delete mode 100644 rust/qemu-api/src/offset_of.rs
 delete mode 100644 subprojects/packagefiles/bilge-impl-1.63.0.patch

-- 
2.49.0


