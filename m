Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uKui3-0002OQ-C8
	for mharc-qemu-rust@gnu.org; Fri, 30 May 2025 04:03:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uKui0-0002N4-EP
 for qemu-rust@nongnu.org; Fri, 30 May 2025 04:03:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uKuhw-0004X3-BF
 for qemu-rust@nongnu.org; Fri, 30 May 2025 04:03:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748592193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jYPBYGUmXs2yG4vRr7M+ICdJJUaeQpgp3Q+Sw8SSdRk=;
 b=F50ZiBPp5NtCvxl5Hz2FXwkCNyAmeM1OiLr6f+jcQ82a8gVz33oA3DWV4Gd/b7mHjGU8XL
 TqINp06Y/Zn3eRfqhMj3O1bYFRyYZYwNyD/LWjyoB4oPkX49yr6zXkcvVyIjupMkRMvO+g
 OXOWoX3dVSqGbNhNbN+q9G/l68TxMkU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-103-CzC1dJ7QMXS9RP1aKLnSbA-1; Fri, 30 May 2025 04:03:11 -0400
X-MC-Unique: CzC1dJ7QMXS9RP1aKLnSbA-1
X-Mimecast-MFC-AGG-ID: CzC1dJ7QMXS9RP1aKLnSbA_1748592190
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-5fcb3e44457so1778367a12.2
 for <qemu-rust@nongnu.org>; Fri, 30 May 2025 01:03:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748592189; x=1749196989;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jYPBYGUmXs2yG4vRr7M+ICdJJUaeQpgp3Q+Sw8SSdRk=;
 b=tynXB4awoX63zZwLhS+besNeVVGa5RHVrH1jkssfAHDyaUTNu4PDWRCxP9EnSoofxJ
 S8jk1FokYQ95jW7mkj5TIW/FV3gJcpVyxG9Jc0VjS1w2+hmXm5w+JhUYfwsaweeKrViw
 mxE7/h6kALEaay8fiI1zYZIPxSyIrz+v9c85m9qHcvtNOn+U/TcLF3hNFrVW9VW0flHP
 A0ruAhmc2eJ8owumaj2IF9z/hEkhWrwIHEYUSrWEo4rn5HQIfxPnBW6T0IEuk0onl5aT
 p4WoO3sM1VHUlr6xBvbDBTXbkKHbXy2y2uxiXe1jCmWFkN19y9e9Y+mbQUV8EpXezP4+
 ISpw==
X-Gm-Message-State: AOJu0YzG2SIFdnqJrsy00RrgnmRzYOZxPSqjC+Rc0iq212S9avhKx9UG
 /cJVBtqP/XDSzRS5lz/5oj1CnvxCLFagGmdVMCT8K3vP1LSLQeyvsT8e2Ek5ToPSeWK+PzCWfb9
 9HkF8ntI8/+U1uatwbyCn9I9K3Ikq+R0q/ZSKEdLJI1ukp4qAddXpEtd8w/aQE7w=
X-Gm-Gg: ASbGncs7JLq5Sw5XzcGqG9ncQweizer6WPcPZPZkA8F1vVLpkq1An93zuXfpPj0BSqr
 xWa0HAEud01aDTUJt9n/tB45zOg1hx62ZzlTjtUCOI71kYFSCODMokXUMj1lgR0lGWpzdUYEMuG
 pP/K4UFbWTsa3N9dFWzdOmN6ZcXZ+yIkXIXTbc0uUEDFAMicViGcK2eCRIzueVPh8zJWSKd2Wa6
 rA7/ygYFbJZ+dSe+0fJIQ8NOc5JSUk7NgRTDAE9qc3wKK7cz8Gp5fsYaGqS6OBZyQ7jkkYs6j7u
 y1VmM5dtmCBQZJK+dYyVGbuj
X-Received: by 2002:a05:6402:430a:b0:604:6149:1c66 with SMTP id
 4fb4d7f45d1cf-6056f4de1e7mr2066508a12.33.1748592189486; 
 Fri, 30 May 2025 01:03:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNId5c6WLNYf2ktXWr3gSo4GlzSPFuzWO57kTgzdMLJzVAzn6Ho8z5Hxy2o7U5Gxoz+6cwTA==
X-Received: by 2002:a05:6402:430a:b0:604:6149:1c66 with SMTP id
 4fb4d7f45d1cf-6056f4de1e7mr2066478a12.33.1748592189036; 
 Fri, 30 May 2025 01:03:09 -0700 (PDT)
Received: from [192.168.122.1] ([151.49.64.79])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60567168300sm1242455a12.69.2025.05.30.01.03.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 01:03:08 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH v2 00/14] rust: bindings for Error
Date: Fri, 30 May 2025 10:02:52 +0200
Message-ID: <20250530080307.2055502-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qilsC9wTafSx4VVqks_oay8Neae_AvZsj5SccjJIqq0_1748592190
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.902,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Fri, 30 May 2025 08:03:20 -0000

As explained for v1, the impetus for this series is to remove BqlCell<>
from HPETState::num_timers.  However, it's also an important step for QAPI:
error propagation is pretty central for example to QMP, and the series
is also a first example of two-way conversion between C and native-Rust
structs (i.e. not using bindgen-generated structs or their opaque wrappers).

As an aside, support for NUL-terminated file is now scheduled for
inclusion in Rust as "panic::Location::file_with_nul()", but it will be
quite a while before QEMU can use it.  For more information, see
https://github.com/rust-lang/rust/issues/141727.

Paolo

v1->v2:
- patch "rust: make declaration of dependent crates more consistent" merged
- change dependency name for anyhow to anyhow-1-rs
- update scripts/archive-source.sh and scripts/make-release [Zhao]
- update foreign to 0.3.1 instead of 0.2.0
- use %.*s to print non-NUL-terminated err->src [Markus]
- make err->src_len an int instead of a size_t [Markus]
- add doc comment for error module
- remove #[derive(Default)] for Error [Markus]
- rewrite ok_or_propagate in functional style [Markus]
- clarify "validity" of Error** [Markus]
- clarify that err_or_unit/err_or_else free the Error* [Markus]

new patches:
- hpet: adjust VMState for consistency with Rust version [Zhao]
- rust: qemu-api: add tests for Error bindings
- docs: update Rust module status


Paolo Bonzini (13):
  subprojects: add the anyhow crate
  subprojects: add the foreign crate
  util/error: expose Error definition to Rust code
  util/error: allow non-NUL-terminated err->src
  util/error: make func optional
  rust: qemu-api: add bindings to Error
  rust: qemu-api: add tests for Error bindings
  rust: qdev: support returning errors from realize
  rust/hpet: change type of num_timers to usize
  hpet: adjust VMState for consistency with Rust version
  hpet: return errors from realize if properties are incorrect
  rust/hpet: return errors from realize if properties are incorrect
  docs: update Rust module status

Zhao Liu (1):
  rust/hpet: Drop BqlCell wrapper for num_timers

 docs/devel/rust.rst                           |   2 +-
 include/qapi/error-internal.h                 |  27 ++
 rust/wrapper.h                                |   1 +
 hw/timer/hpet.c                               |  21 +-
 util/error.c                                  |  20 +-
 rust/Cargo.lock                               |  17 +
 rust/Cargo.toml                               |   1 +
 rust/hw/char/pl011/src/device.rs              |   5 +-
 rust/hw/timer/hpet/src/device.rs              |  62 ++-
 rust/hw/timer/hpet/src/fw_cfg.rs              |   7 +-
 rust/meson.build                              |   4 +
 rust/qemu-api/Cargo.toml                      |   2 +
 rust/qemu-api/meson.build                     |   3 +-
 rust/qemu-api/src/error.rs                    | 403 ++++++++++++++++++
 rust/qemu-api/src/lib.rs                      |   3 +
 rust/qemu-api/src/qdev.rs                     |  10 +-
 scripts/archive-source.sh                     |   5 +-
 scripts/make-release                          |   5 +-
 subprojects/.gitignore                        |   2 +
 subprojects/anyhow-1-rs.wrap                  |   7 +
 subprojects/foreign-0.3-rs.wrap               |   7 +
 .../packagefiles/anyhow-1.0-rs/meson.build    |  33 ++
 .../packagefiles/foreign-0.3-rs/meson.build   |  26 ++
 23 files changed, 602 insertions(+), 71 deletions(-)
 create mode 100644 include/qapi/error-internal.h
 create mode 100644 rust/qemu-api/src/error.rs
 create mode 100644 subprojects/anyhow-1-rs.wrap
 create mode 100644 subprojects/foreign-0.3-rs.wrap
 create mode 100644 subprojects/packagefiles/anyhow-1.0-rs/meson.build
 create mode 100644 subprojects/packagefiles/foreign-0.3-rs/meson.build

-- 
2.49.0


