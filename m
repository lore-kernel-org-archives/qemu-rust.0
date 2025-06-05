Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uN7di-0007Lc-1S
	for mharc-qemu-rust@gnu.org; Thu, 05 Jun 2025 06:16:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uN7db-0007Ig-Ff
 for qemu-rust@nongnu.org; Thu, 05 Jun 2025 06:15:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uN7dW-0001Cw-LK
 for qemu-rust@nongnu.org; Thu, 05 Jun 2025 06:15:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749118548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hyKz6nWErMiubgubQFr6FKvLFAmnjsB5MvJF4fUeC4E=;
 b=c+JMSlO0dV5zxBLu7FagSua/l97vOsdJx/9JFeaLoP8CpinvB2agup7eNk15NZUOIioeu2
 oAy9lwpwErULOjiBT/9Alhm7DUp4/gPhQ8yfTM9zL7uymqreuYpaFy48erUsVo9pjVnJ9x
 zikiXGWrTImco2npVoSg9Jnfiwgu3mk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-38-MWh219XxOpuO0as-6K1fCA-1; Thu, 05 Jun 2025 06:15:47 -0400
X-MC-Unique: MWh219XxOpuO0as-6K1fCA-1
X-Mimecast-MFC-AGG-ID: MWh219XxOpuO0as-6K1fCA_1749118546
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3a4f8fd1856so379545f8f.2
 for <qemu-rust@nongnu.org>; Thu, 05 Jun 2025 03:15:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749118546; x=1749723346;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hyKz6nWErMiubgubQFr6FKvLFAmnjsB5MvJF4fUeC4E=;
 b=Y6Y9fthE8RO1/ebXpgfbW0YdT53p6jcC6VrkwtM4LdHBZipG5nDYlf9qpZ+q82gbhV
 aAVipIU9gw+FRBa/e7QXBmcOeiBN5tI7sV0R54XRu1Bu9SA3keqfrwau8C8Wx3eidPeD
 obuGqIfWoub4vh41+9I6d51yeimcBCeIWcNbWMAMMGhNg7jJgKpeuROgKi8ehywbhcrR
 XH/bNTAJ+ryHER88znYMjOHBfPwc1sic1rLYTHnwVmP8LZF9IABhHYKegS4lBnAe5IAx
 AsnFLB2w3su/9mKgOziWaR9AJdJbilcsOUqszru0EKk7u309dGX1pqurgLGqHG1q6yFd
 RCWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnfuuSZJihD3arGuN4jtGoMnxM4AoBKMvZdspCsg/yCiQIaHmdPsdf5s2n9pGy9MSZw6VWe1cfwNc=@nongnu.org
X-Gm-Message-State: AOJu0Yza9kWJs/rUsYD7avnCbQ+j+zTQEOFbZtuilr71aAQHvJB0Ibia
 pwyqSxPQoAi8iBHKXVkPryjnmdOkS8BZ7ry6QeU2lFoDVZXFjTPI7qumHmLTGEW/sgcIpGaSZ/p
 GsW/l9F+XLuTZTx53kqLRLhroC/wE6L2yvyK864IaBrj7a3UuG4mJ5ZQ=
X-Gm-Gg: ASbGnctnsomQI1lQcec+JvQAS85vwjqSW1h+29VxfBBhx5Qypvif78U2c21SCnh+xrK
 KPPc1MLQ6ar1g4RWgS+aKjUvyaGDLK5rTcNAPknQxMdCfdjWKTVvwq/dlOOJrPltuI6pG6dcTqo
 lAnHalHEmOcLaWh+wRtnNpGtDRUWLB1ZrHbWuWTBI3f2Omi75Y/XM0FA/RwcQxDCrkH7mqxTdKp
 vcwQ0P9Yi29RZ3gutoNX1W097rAe4MXsQrBNy5eh4wsi+aj+Ola73uOySCugMESLD0PhTgCjaFj
 8HnBXzgM+EMCLA==
X-Received: by 2002:a05:6000:230b:b0:3a4:ca73:75e3 with SMTP id
 ffacd0b85a97d-3a51d8f9ea1mr4995295f8f.12.1749118546380; 
 Thu, 05 Jun 2025 03:15:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEdukYa7botr0/VdyTX3jqMqLBr7Rz+hpbSnXCUZDyEesLGjcaXT6aEnu8SD6qTpdlxlZszA==
X-Received: by 2002:a05:6000:230b:b0:3a4:ca73:75e3 with SMTP id
 ffacd0b85a97d-3a51d8f9ea1mr4995269f8f.12.1749118545945; 
 Thu, 05 Jun 2025 03:15:45 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.64.79])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4efe5b8f0sm23797310f8f.6.2025.06.05.03.15.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 03:15:45 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
	zhao1.liu@intel.com,
	qemu-rust@nongnu.org
Subject: [PATCH v3 00/14] rust: bindings for Error
Date: Thu,  5 Jun 2025 12:15:29 +0200
Message-ID: <20250605101544.368953-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EggImaBgcx2cngNeYIpywo1YN57kuvasLNj5DxACsLY_1749118546
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.128,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-List-Received-Date: Thu, 05 Jun 2025 10:15:59 -0000

As explained for v1, the impetus for this series is to remove BqlCell<>
from HPETState::num_timers.  However, it's also an important step for QAPI:
error propagation is pretty central for example to QMP, and the series
is also a first example of two-way conversion between C and native-Rust
structs (i.e. not using bindgen-generated structs or their opaque wrappers).

The differences from v2 and v3 are:
* documentation
* correctly using error_propagate()
* panicking on errors with no message and no cause

Based-on: <20250603214523.131185-1-pbonzini@redhat.com>

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

 docs/devel/rust.rst                           |   7 +-
 include/qapi/error-internal.h                 |  35 ++
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
 rust/qemu-api/src/error.rs                    | 416 ++++++++++++++++++
 rust/qemu-api/src/lib.rs                      |   3 +
 rust/qemu-api/src/qdev.rs                     |  10 +-
 scripts/archive-source.sh                     |   5 +-
 scripts/make-release                          |   5 +-
 subprojects/.gitignore                        |   2 +
 subprojects/anyhow-1-rs.wrap                  |   7 +
 subprojects/foreign-0.3-rs.wrap               |   7 +
 .../packagefiles/anyhow-1.0-rs/meson.build    |  33 ++
 .../packagefiles/foreign-0.3-rs/meson.build   |  26 ++
 23 files changed, 628 insertions(+), 71 deletions(-)
 create mode 100644 include/qapi/error-internal.h
 create mode 100644 rust/qemu-api/src/error.rs
 create mode 100644 subprojects/anyhow-1-rs.wrap
 create mode 100644 subprojects/foreign-0.3-rs.wrap
 create mode 100644 subprojects/packagefiles/anyhow-1.0-rs/meson.build
 create mode 100644 subprojects/packagefiles/foreign-0.3-rs/meson.build

-- 
2.49.0


