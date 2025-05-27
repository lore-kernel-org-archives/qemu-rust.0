Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uJxiv-0005eT-9Q
	for mharc-qemu-rust@gnu.org; Tue, 27 May 2025 13:04:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uJxiq-0005cP-0w
 for qemu-rust@nongnu.org; Tue, 27 May 2025 13:04:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uJxim-0006fo-Rf
 for qemu-rust@nongnu.org; Tue, 27 May 2025 13:04:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748365449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+bQUtrj+W7/yWWbiG+VwobJE5SaWcMWQz69Z0fjaNGw=;
 b=W3dyEmo8oAP6xlLM8Y4u3IrBOjXqnLiQr59chPUcRAqgnd2vesBRqsFThNVi+l8Bru+9+J
 ZdZIXuZthWpd6Xca6jU7uQWUQZxcsZuu4iljnRQUYA0mOSq5RHZcr2CJ2hsh1sAXErRA15
 pjCI7+Ww+jzsKdTAeosHrUiFsvo1GYY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-44-dJMmQ-DwNRW26n8Hi8BdKw-1; Tue, 27 May 2025 13:04:07 -0400
X-MC-Unique: dJMmQ-DwNRW26n8Hi8BdKw-1
X-Mimecast-MFC-AGG-ID: dJMmQ-DwNRW26n8Hi8BdKw_1748365446
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-ad56a52edc5so358772166b.0
 for <qemu-rust@nongnu.org>; Tue, 27 May 2025 10:04:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748365446; x=1748970246;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+bQUtrj+W7/yWWbiG+VwobJE5SaWcMWQz69Z0fjaNGw=;
 b=ekavoenLlmZJTwp9XE91/CTdKZt4l+33xo1220yk32cV7SufoMQ3rRCgQX/Jx1DFUV
 gEb0RhWF+z5b5K80V2hvfqG1MLRLJkHalgNnNlPjwbO4hh4C4zOYbvmTfZzsJNr4BZMm
 LBSbvvUbGtsK0dwFb/HlA9Y1MqAJ0gg2w4Ea/6UWoWZV9L3wlLg69xxgZrDeaUDgXNxF
 jJuOh0Mmke9VKpBrHs6UzFxsbHkKFtdyZPVzmf3+RWaGrejj6DfgPExqPy1m9pQ78OJ9
 wF1tcwuUtE6cidoPIoK5RCbRd9fiSzP5zYHvC4+gYimoq6xxeNmYJGidEuHf5ZwwmM28
 RGiQ==
X-Gm-Message-State: AOJu0YxJpQlEmZhBPKd4dNTZ/xThlIqcuDurdSzkc4Rz+G4M4iqZJnWo
 vn8VcnXpd8KvgVNfnvC70lDzCHb0BUTW2b3yRFK7RGJJW4iXJBsADgFhyxhUPW1eQXw8l83rI+d
 02XloOLStEEuuPzHXOA1frkCKPk3VkyGRSydgz53vdtqRGY4FLcseiP8=
X-Gm-Gg: ASbGnctavUvxoNyI/mtk9DHTnZr52UUS2AuPIP04dl3OVDT9FdtNSzj0a4spOZVUiM+
 hrZoSgTRwtNrlNRKCBkKu7KVSQgeXvyDZitCOW+VvmlLtPeSArx2nCYSEU+xn/NDyqKEFHBjknW
 gczzAKPu9NLxNPojxTBP3Tyy7TelMi/2IBe9mRTyrCBNAt0Ln3wq0D9JS8AQvA5CsaEyaP01vhR
 FvJT0JW4HPZA7R4Cx1uaE8onMs/KHq23nQ7ram6WPCTILerHMnJfoFC0e+a4EnFV+ARTyJvhkoq
 NDHcPaRbMRB83g==
X-Received: by 2002:a17:907:7207:b0:ad8:9428:6a35 with SMTP id
 a640c23a62f3a-ad894286cc0mr238405766b.7.1748365446294; 
 Tue, 27 May 2025 10:04:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHr1la6R4qetkiI4EyZincW6nFrFxeMC0AvMwEURCq1x5KT7VBiS94H1KZeoBmetl0ZxoF/YQ==
X-Received: by 2002:a17:907:7207:b0:ad8:9428:6a35 with SMTP id
 a640c23a62f3a-ad894286cc0mr238400066b.7.1748365445782; 
 Tue, 27 May 2025 10:04:05 -0700 (PDT)
Received: from [192.168.122.1] ([151.95.46.79])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad5b192cb0asm1097532966b.170.2025.05.27.10.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 May 2025 10:04:05 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 0/6] rust: update build system for Meson 1.8.1
Date: Tue, 27 May 2025 19:03:58 +0200
Message-ID: <20250527170404.1580482-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KjN4SokYEEsKLsgYnzIvA-A4f-qTNfSH98wv_XF4ASY_1748365446
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.907,
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
X-List-Received-Date: Tue, 27 May 2025 17:04:18 -0000

Meson 1.7.0 and 1.8.0 include improved support for Rust, namely:
* support for "objects" in Rust executables
* support for doctest targets
* invoking clippy and rustdoc

Use it to remove BQL-related hacks, fix --enable-modules --enable-rust
and also simplify the Meson logic for building the qemu-api crate
(which may help splitting the crate, too).

Note that this does *not* yet require 1.8.1 for all of QEMU; the
requirement is only there if Rust is enabled.

Paolo

Supersedes: <20250405100603.253421-1-pbonzini@redhat.com>



Paolo Bonzini (6):
  meson: update to version 1.8.1
  rust: use "objects" for Rust executables as well
  build, dockerfiles: add support for detecting rustdoc
  rust: add qemu-api doctests to "meson test"
  rust: cell: remove support for running doctests with "cargo test
    --doc"
  rust: use native Meson support for clippy and rustdoc

 docs/devel/rust.rst                           |  12 ++++---
 configure                                     |  16 +++++++++
 meson.build                                   |   4 ++-
 .gitlab-ci.d/buildtest-template.yml           |   3 +-
 .gitlab-ci.d/buildtest.yml                    |  11 ++-----
 rust/clippy.toml => clippy.toml               |   0
 python/scripts/vendor.py                      |   4 +--
 python/wheels/meson-1.5.0-py3-none-any.whl    | Bin 959846 -> 0 bytes
 python/wheels/meson-1.8.1-py3-none-any.whl    | Bin 0 -> 1013001 bytes
 pythondeps.toml                               |   2 +-
 rust/Cargo.toml                               |   1 -
 rust/meson.build                              |  14 ++------
 rust/qemu-api/meson.build                     |  31 +++++++-----------
 rust/qemu-api/src/cell.rs                     |  22 +++++--------
 scripts/rust/rustc_args.py                    |   5 +--
 .../dockerfiles/fedora-rust-nightly.docker    |   2 ++
 tests/docker/dockerfiles/ubuntu2204.docker    |   1 +
 tests/lcitool/mappings.yml                    |   6 +++-
 tests/lcitool/refresh                         |   3 ++
 19 files changed, 69 insertions(+), 68 deletions(-)
 rename rust/clippy.toml => clippy.toml (100%)
 delete mode 100644 python/wheels/meson-1.5.0-py3-none-any.whl
 create mode 100644 python/wheels/meson-1.8.1-py3-none-any.whl

-- 
2.49.0


