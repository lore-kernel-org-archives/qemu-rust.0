Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD44CD185F1
	for <qemu-rust@archiver.kernel.org>; Thu,  8 Jan 2026 13:11:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vdpmy-0007Ur-5X; Thu, 08 Jan 2026 08:10:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vdpmw-0007UW-Um
 for qemu-rust@nongnu.org; Thu, 08 Jan 2026 08:10:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vdpmt-0007wq-IE
 for qemu-rust@nongnu.org; Thu, 08 Jan 2026 08:10:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1767877849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6B2ZYysiltix8VuP3De062yNJ19BopVZh/6IhC/NrT4=;
 b=d8wNnAmVMpY/NwRfQQLOZfvLi6hVo4zrUT/mdE6w1uzvdrwiWqkkgrJMgePR4xCYHqv2vy
 MOymYVkd+00+Mp+Cvko6B3SkknAaSS/1Hvm7nYDTaRPIok5UeM3sA4xRmnq6o10xxbqe02
 zDINWPp021bejMLBFIiow002Cft/1y8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-42-a53HS3eyO1GYiKfPGgm8qA-1; Thu, 08 Jan 2026 08:10:48 -0500
X-MC-Unique: a53HS3eyO1GYiKfPGgm8qA-1
X-Mimecast-MFC-AGG-ID: a53HS3eyO1GYiKfPGgm8qA_1767877847
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4776079ada3so30516945e9.1
 for <qemu-rust@nongnu.org>; Thu, 08 Jan 2026 05:10:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767877846; x=1768482646;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6B2ZYysiltix8VuP3De062yNJ19BopVZh/6IhC/NrT4=;
 b=mGNZUnSP5PE7ZFAlGkrYqtgAMYrxbDQs/bN6YR2Qcu2bC1i7VUe1iyZJCVle1NoHkH
 Tjdy2MgYbMxwVqk5os6Ih8VEL9p7wjrhMqhH2AcPLrGP4NR5aei/25WMK2B+7yEv8zAF
 iWQ7n+5fMSHACwp7PqjWU3pDb9lSeMtyWF4VwnJE8kvBcIBvByKp0PLivi7DHqsF0j9o
 cOqx040BfRBOtDxFVVCxbjjlx9PnZN40D/7Kqo023PUzzJ81Dz0vvPZU3UVANa+eweVs
 jhP8mGki12OFuvnB2nr3v0xmVnojrtHToDFguaHmyOTfeft05ERv6ik+rOYqn6WSobLv
 YyfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXy13vC4zqm9ptIHf05ItSRox5P4ozEFGJB0pN7PvCk4/gnrkWENdCVHzBI+MX26767aUb0KsEJU0=@nongnu.org
X-Gm-Message-State: AOJu0YyKoOgB2bF+Pl71z9dJ95VsdSKxqBp0fWpDfDfxiHnk3f1W7hWH
 VCxNNjGTNgnBieqa/na+WqCGXM0SnjjQK2Noi4UFGtMgBnW0AGMXbNtbSulrl/T41RboKK91jHY
 xckq4U4qM89R4FxyQ9bn6RZA45UX4btdvokuyCYPge7hposSPxUmIZ0x3PZGd3dY=
X-Gm-Gg: AY/fxX4Dh+vR4MNE2S2WhA7k8hpk5zdNPTcYCQ4ghbsqijY6NhhoE8yPFb3V5kc38Kd
 QciAHpkm0+iZxSakihD6CBWi3oJUgs4zIKL+YFsXlL3K6xjTINUyRBv0p2Vi3235fLzhvmXLax2
 JaI4gVWWBJ3Z6zz699vxE368r3jxGZnf211PZ0i/1leApQWLHJmjN/sMpVhbmYHhFfq/MI6x8Ja
 +nfJEnfDDr8wibQFRKRjTAVcgum0i1209SAzz9v4NHRhlpvUht+Zee9vYvav9wz8sN57dZDUnJa
 Hph0zh/ZSKlffmQiAihYiOxxexu/i8xHFb5QsWUHRCWPNC37SubgAufFtcV46wdJy5HSwdkiqxZ
 dPfP2xH6SpeboSmzxg+NClCLEK83AvaWpRoltgW9ZiSwvWdd7eZWHwoMC86nzEhPg2PfiYnzS5c
 jjgKIJsSOnGQTARQ==
X-Received: by 2002:a05:600c:8b82:b0:477:7b9a:bb07 with SMTP id
 5b1f17b1804b1-47d84b5405amr73540405e9.35.1767877846201; 
 Thu, 08 Jan 2026 05:10:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIDVE/JBnRchtAQ9Fui7vqEkTuhNYkD46ZGMRHGTWcthpaqc/ivbCOHPiuCprfiXZya+HCaw==
X-Received: by 2002:a05:600c:8b82:b0:477:7b9a:bb07 with SMTP id
 5b1f17b1804b1-47d84b5405amr73540185e9.35.1767877845766; 
 Thu, 08 Jan 2026 05:10:45 -0800 (PST)
Received: from [192.168.10.48] ([151.61.26.160])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f69e13bsm150244705e9.7.2026.01.08.05.10.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 05:10:44 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-rust@nongnu.org
Subject: [PATCH v2 00/16] rust: QObject and QAPI bindings
Date: Thu,  8 Jan 2026 14:10:27 +0100
Message-ID: <20260108131043.490084-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -MgVaP_kMJspGTvfYQUh61c456CUv7Fwdz7tbxg_S6c_1767877847
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
as the visitor arguments (for example NUL-terminated strings).

The serde format implementation was co-authored by me and Marc-André.
Marc-André did all the bug fixing and integration testing.

As an example of how this would be used, the marshaling functions for
QMP commands would look like this:

fn qmp_marshal_query_stats(args: *mut QDict,
    retp: *mut *mut QObject, errp: *mut *mut Error)
{
    let qobj = unsafe { QObject::cloned_from_raw(args.cast()) };

    let result = from_qobject::<StatsFilter>(qobj)
         .map_err(anyhow::Error::from)
         .and_then(qmp_query_stats)
         .and_then(|ret| to_qobject::<Vec<StatsResult>>(ret).map_err(anyhow::Error::from));

    match qmp_marshal_query_stats_rs(qobj) {
        Ok(ret) => unsafe { *retp = ret.into_raw(); },
        Err(e) => unsafe { crate::Error::from(e).propagate(errp) },
    }
}

Despite the long v1->v2, the changes are mostly cosmetic; there are a few
small differences in the detection of types to be wrapped with Box<>,
because Vec<> is now considered to break cycles.

Available at branch rust-next of https://gitlab.com/bonzini/qemu (which
is now almost empty other than this series, yay).

Paolo

v1->v2, Rust:
- adjust comments in C code (include/qobject/qobject.h)
- improve or fix documentation in rust/util/src/qobject/mod.rs
- introduce a qobject! macro that is equivalent to QOBJECT()
- remark when functions are converted from C inlines
- rename from_int/from_uint/from_double macros
- fix incorrect "native: true" on serde and serde_core overrides
- rebase

qapi-gen:
- rewrite QAPISchemaIfCond.rsgen() to avoid messy typing
- new patches 10-11 to extend existing qapigen code
- rewritten rs_type() to avoid going through a C type first
- removed renaming of QAPICBackend
- reused C functions for case conversions
- clean up rs_name, move it to common.py (needed for rs_type() changes)
- Vec<> can break cycles and avoid boxing of structs
- restrict squashing of consecutive newlines to Rust code
- add copyright blurb
- annotate that using a separate qapi-gen backend is temporary
- drop #[derive(common::TryInto)] from enums

Marc-André Lureau (7):
  rust/qobject: add Display/Debug
  scripts/qapi: add QAPISchemaIfCond.rsgen()
  scripts/qapi: generate high-level Rust bindings
  scripts/rustc_args: add --no-strict-cfg
  rust/util: build QAPI types
  scripts/qapi: add serde attributes
  rust/tests: QAPI integration tests

Paolo Bonzini (9):
  rust/qobject: add basic bindings
  subprojects: add serde
  rust/qobject: add Serialize implementation
  rust/qobject: add Serializer (to_qobject) implementation
  rust/qobject: add Deserialize implementation
  rust/qobject: add Deserializer (from_qobject) implementation
  rust/qobject: add from/to JSON bindings for QObject
  scripts/qapi: add QAPISchemaType.is_predefined
  scripts/qapi: pull c_name from camel_to_upper to caller

 docs/devel/rust.rst                           |   1 +
 meson.build                                   |   4 +-
 include/qobject/qobject.h                     |   5 +-
 rust/util/wrapper.h                           |   8 +
 qapi/meson.build                              |   9 +
 rust/Cargo.lock                               |   2 +
 rust/Cargo.toml                               |   2 +
 rust/meson.build                              |   4 +
 rust/tests/meson.build                        |  21 +-
 rust/tests/tests/integration.rs               |   2 +
 rust/tests/tests/qapi.rs                      | 444 +++++++++++++
 rust/util/Cargo.toml                          |   2 +
 rust/util/meson.build                         |  30 +-
 rust/util/src/lib.rs                          |   4 +
 rust/util/src/qobject/deserialize.rs          | 134 ++++
 rust/util/src/qobject/deserializer.rs         | 371 +++++++++++
 rust/util/src/qobject/error.rs                |  58 ++
 rust/util/src/qobject/mod.rs                  | 383 ++++++++++++
 rust/util/src/qobject/serialize.rs            |  59 ++
 rust/util/src/qobject/serializer.rs           | 585 ++++++++++++++++++
 scripts/archive-source.sh                     |   3 +
 scripts/make-release                          |   2 +-
 scripts/qapi/backend.py                       |  25 +
 scripts/qapi/common.py                        |  66 +-
 scripts/qapi/rs.py                            |  61 ++
 scripts/qapi/rs_types.py                      | 394 ++++++++++++
 scripts/qapi/schema.py                        |  74 ++-
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
 38 files changed, 2910 insertions(+), 33 deletions(-)
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
2.52.0


