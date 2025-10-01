Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE457CAC5BB
	for <qemu-rust@archiver.kernel.org>; Wed,  1 Oct 2025 08:03:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v3rmE-0005gV-Ch; Wed, 01 Oct 2025 04:01:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v3rm7-0005ef-OQ
 for qemu-rust@nongnu.org; Wed, 01 Oct 2025 04:01:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v3rln-0005yq-R2
 for qemu-rust@nongnu.org; Wed, 01 Oct 2025 04:01:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759305655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/NkL/vYtvW/BLGGMd/HDYs/2PWNxh9snrpqOT4WEAHY=;
 b=RKfTetq1uPuM9EhLj1tEen4x4uG4jN7brG5fCuakDqkQ701+T9ZN57MUv4/SnysAsx8J/y
 Q/moITfc9ehiYELtUy/k/LwHEUo/eXm7KsdgCTmgQgwxL1JpC0ecgyFqyUamP56Jqqn+St
 yOG20KrPS96rnj0btC0a27+9StiChro=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-147-S7jGnA81NNipW9dGetpBcQ-1; Wed, 01 Oct 2025 04:00:54 -0400
X-MC-Unique: S7jGnA81NNipW9dGetpBcQ-1
X-Mimecast-MFC-AGG-ID: S7jGnA81NNipW9dGetpBcQ_1759305653
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-afcb72a8816so642292466b.0
 for <qemu-rust@nongnu.org>; Wed, 01 Oct 2025 01:00:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759305653; x=1759910453;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/NkL/vYtvW/BLGGMd/HDYs/2PWNxh9snrpqOT4WEAHY=;
 b=OpvsoEVuC220zwGcTHtu7n8irD4KDRY5H/rwdMDEbvkhARy3bvJGRQ/oQzYq2S/E04
 7dYefzBGuy2DrHTup/qxEqwG0Q4Z7aJkzGBmVnsbNU8Q9TtyQ5hhRDN/aqNGDuOPLcLe
 bpS278F31XsbbamyT/Qgn61CCugvk8RwuLXSvpDL5VwlVREBRl/tCWmpxKkfCr6nPjUi
 YPw16NK1r3jIJ/7wNIFka0igJ3S7cZqHsEWn4h3P5pTDaioWYBHaRW8/OLfioyVEffap
 yXSxQakC6nYRX/osXAr8npiRbOBIpMEyRht4JBmo2D8ZwBo8tZ9TSqoVxUnvk+9nBF9l
 +B7Q==
X-Gm-Message-State: AOJu0YzkQkEi8b8O0ebngGmwDjwvq1bRobGxyE49huCcP6/6tZe0ZvPW
 LeVieQhBJDhwpUu3BV2TNFdGtTGKpubvU7kpmtkt/YJ0MB8EaaUMy5/KzQ8XCqmySpgfuZ8m26i
 uYFROnHtLSzvkyBWfzRhOUt9D3fxE2u4qhA5mqVwnocNB/DBycO1jyao=
X-Gm-Gg: ASbGncvQWy5YqsvZdtF+jCmsuPXUxQ4LRY641acp346tj9nl5UQrr6dRzDb6oGU6tnR
 IH13AOjG7CUi+DfO9RsRTqQMJdnyBjC2KAm9yCy2Sj9VzkLKZKGrKzPeadulwWiSztpu62vSTt3
 5npJP8vsRdAqcy93tsWrqGe5UKZ18gnYV6esok5jsDdGv/JHfjYbVW31rE4GH9t15ejmK6J7gg9
 8xhx1DTjF209xieRKqV5qx82pr3q7qQBcgfTo1LeF2RXeeZI7s1k3J9zT3uZfXQYg0MBpI2G2w5
 25+0YFtEiL15qH6WIc4nn6AcYz+kNiUr67ghN6veavE7C4hGrBA8LT0TOzkRHlUUR+Gc6Fnjf50
 Ny0Po1moQHLOF5BvF3BYjNgujtsseagFZmLSO49fLM8+cwWPT5r8=
X-Received: by 2002:a17:906:c103:b0:b41:c892:2c6e with SMTP id
 a640c23a62f3a-b46e9279122mr301396966b.43.1759305653296; 
 Wed, 01 Oct 2025 01:00:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkKcjRotcGxfTjDW3RYtnRw3KX2nfJpAC9AxyfOxP47odgYZp10+ppBUy4Wl5aKwIoHAxR9g==
X-Received: by 2002:a17:906:c103:b0:b41:c892:2c6e with SMTP id
 a640c23a62f3a-b46e9279122mr301392366b.43.1759305652870; 
 Wed, 01 Oct 2025 01:00:52 -0700 (PDT)
Received: from [192.168.10.48] ([176.206.127.188])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b3545a98d7fsm1315436866b.100.2025.10.01.01.00.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 01:00:52 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	armbru@redhat.com,
	marcandre.lureau@redhat.com
Subject: [PATCH preview 00/14] rust: QObject and QAPI bindings
Date: Wed,  1 Oct 2025 10:00:37 +0200
Message-ID: <20251001080051.1043944-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001075005.1041833-1-pbonzini@redhat.com>
References: <20251001075005.1041833-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: b8m6PSqqEU5bb0D9sO_U_Hy2zIjjxykfv5uErX_Ljlw_1759305653
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org

This adds two related parts of the Rust bindings:

- QAPI code generator that creates Rust structs from the JSON
  description.  The structs are *not* ABI compatible with the
  C ones, instead they use native Rust data types.

- QObject bindings and (de)serialization support, which can be used to
  convert QObjects to and from QAPI structs.

Unfortunately Rust code is not able to use visitors, other than by
creating an intermediate QObject.  This is because of the different
architecture of serde vs. QAPI visitors, and because visitor's
dual-purpose functions, where the same function is used by both input and
output visitors, rely heavily on the structs using the same representation
as the visitor arguments (for example NUL-terminated strings.

The serde format implementation was co-authored by me and Marc-André.
Marc-André did all the bug fixing and integration testing; and there
are a lot more bugs to be fixed / tests to be written, so this is just
a preview.

Paolo

Marc-André Lureau (7):
  rust/qobject: add Display/Debug
  scripts/qapi: add QAPISchemaIfCond.rsgen()
  scripts/qapi: generate high-level Rust bindings
  scripts/qapi: strip trailing whitespaces
  scripts/rustc_args: add --no-strict-cfg
  rust/util: build QAPI types
  rust: start qapi tests

Paolo Bonzini (7):
  qobject: make refcount atomic
  rust: add basic QObject bindings
  subprojects: add serde
  rust: add Serialize implementation for QObject
  rust: add Serializer (to_qobject) implementation for QObject
  rust: add Deserialize implementation for QObject
  rust: add Deserializer (from_qobject) implementation for QObject

 docs/devel/rust.rst                           |   1 +
 meson.build                                   |   4 +-
 include/qobject/qobject.h                     |   5 +-
 rust/util/wrapper.h                           |   8 +
 qapi/meson.build                              |   6 +
 rust/Cargo.lock                               |   2 +
 rust/Cargo.toml                               |   2 +
 rust/meson.build                              |   2 +
 rust/tests/meson.build                        |  10 +-
 rust/tests/tests/integration.rs               |   2 +
 rust/tests/tests/qapi.rs                      |  35 ++
 rust/util/Cargo.toml                          |   2 +
 rust/util/meson.build                         |  31 +-
 rust/util/src/lib.rs                          |   2 +
 rust/util/src/qobject/deserialize.rs          | 134 ++++
 rust/util/src/qobject/deserializer.rs         | 373 +++++++++++
 rust/util/src/qobject/error.rs                |  58 ++
 rust/util/src/qobject/mod.rs                  | 353 +++++++++++
 rust/util/src/qobject/serialize.rs            |  59 ++
 rust/util/src/qobject/serializer.rs           | 585 ++++++++++++++++++
 scripts/archive-source.sh                     |   3 +
 scripts/make-release                          |   2 +-
 scripts/qapi/backend.py                       |  28 +-
 scripts/qapi/common.py                        |  16 +
 scripts/qapi/gen.py                           |   6 +-
 scripts/qapi/main.py                          |   4 +-
 scripts/qapi/rs.py                            | 176 ++++++
 scripts/qapi/rs_types.py                      | 354 +++++++++++
 scripts/qapi/schema.py                        |   4 +
 scripts/rust/rustc_args.py                    |  16 +-
 subprojects/.gitignore                        |   3 +
 .../packagefiles/serde-1-rs/meson.build       |  36 ++
 .../packagefiles/serde-1.0.226-include.patch  |  16 +
 .../packagefiles/serde_core-1-rs/meson.build  |  25 +
 .../serde_core-1.0.226-include.patch          |  15 +
 .../serde_derive-1-rs/meson.build             |  35 ++
 .../serde_derive-1.0.226-include.patch        |  11 +
 subprojects/serde-1-rs.wrap                   |  11 +
 subprojects/serde_core-1-rs.wrap              |  11 +
 subprojects/serde_derive-1-rs.wrap            |  11 +
 40 files changed, 2438 insertions(+), 19 deletions(-)
 create mode 100644 rust/tests/tests/integration.rs
 create mode 100644 rust/tests/tests/qapi.rs
 create mode 100644 rust/util/src/qobject/deserialize.rs
 create mode 100644 rust/util/src/qobject/deserializer.rs
 create mode 100644 rust/util/src/qobject/error.rs
 create mode 100644 rust/util/src/qobject/mod.rs
 create mode 100644 rust/util/src/qobject/serialize.rs
 create mode 100644 rust/util/src/qobject/serializer.rs
 create mode 100644 scripts/qapi/rs.py
 create mode 100644 scripts/qapi/rs_types.py
 create mode 100644 subprojects/packagefiles/serde-1-rs/meson.build
 create mode 100644 subprojects/packagefiles/serde-1.0.226-include.patch
 create mode 100644 subprojects/packagefiles/serde_core-1-rs/meson.build
 create mode 100644 subprojects/packagefiles/serde_core-1.0.226-include.patch
 create mode 100644 subprojects/packagefiles/serde_derive-1-rs/meson.build
 create mode 100644 subprojects/packagefiles/serde_derive-1.0.226-include.patch
 create mode 100644 subprojects/serde-1-rs.wrap
 create mode 100644 subprojects/serde_core-1-rs.wrap
 create mode 100644 subprojects/serde_derive-1-rs.wrap

-- 
2.51.0


