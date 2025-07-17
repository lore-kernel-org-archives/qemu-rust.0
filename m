Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA8C6C83F1A
	for <qemu-rust@archiver.kernel.org>; Thu, 17 Jul 2025 06:47:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1ucIOO-0000lU-R3; Thu, 17 Jul 2025 02:46:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ucI5l-0008Ad-8Z
 for qemu-rust@nongnu.org; Thu, 17 Jul 2025 02:27:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ucI5f-00085k-IE
 for qemu-rust@nongnu.org; Thu, 17 Jul 2025 02:27:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752733653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=A7MqYkErdty9uD7TbD+Z+ihMDFjNt79Yru60c119ORA=;
 b=Ih6gq2KOXu8TxHvmklmXk1pxn87dEebAo3cIEL2sMVd0SBvGzabHMLcIrW5D5EbOrCKOO8
 JSy776Nc8UCuW8ralnU+txH8f639XdXM2BCIZ/mgD4zhkyP6TT3NO3f3QSD42gQj8NSxaJ
 7zhW3Z8/nwo6w5M3cTLW9WFd4Col/Cg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-8-aoLBJfFcPOW5xqd8P3d_fg-1; Thu, 17 Jul 2025 02:27:32 -0400
X-MC-Unique: aoLBJfFcPOW5xqd8P3d_fg-1
X-Mimecast-MFC-AGG-ID: aoLBJfFcPOW5xqd8P3d_fg_1752733651
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3b39cc43f15so256753f8f.2
 for <qemu-rust@nongnu.org>; Wed, 16 Jul 2025 23:27:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752733650; x=1753338450;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A7MqYkErdty9uD7TbD+Z+ihMDFjNt79Yru60c119ORA=;
 b=ol5cZo8fhjOVaWJGZyB68y8ceMfaAMlIHhPky8D6k4/gC3TTXYNrNKvlci6D/vj7iQ
 Zdwu9n53lty2aJRNKLj78fjI4VvuOtIt0PbkhJb6nE5+VefYkCTwvsfqDJL9vvtH1j+A
 AEShkSQ8o72uHzCJzeCKpOhSInjRXk7mTZSS4fi5bTQ7JBRjc1KsfMJ1dgRY3Tz0QauX
 GGyKJyTelEofrxQgfPa0B1YpESyNMTySmp2N91TowU9W+xR/nNbbaXlkHIFCujF800u/
 Hzq2SpT22NaGFScWx+xe9F7KApEzGank8K6AyA/rzJbsiIEbTN07LkTYqvzUrSkeXX//
 ox5w==
X-Gm-Message-State: AOJu0YzYQ/FRYuwgB0YaO9RwnJF/d+8w4j9d4QlG+iB1hxGycluFVAaz
 7XWuwn3l0CkIdkeLd6LUEEtrYp7o0QjcnkA4lsiy2XeIqcfQxizzqULJ6UqKvqoEa9/gDKNRmV8
 6bIVp1+dSoSRhyUP7cWLgP7aRURDwOz6o1nRlrHqauGr3/8U3YPzhvFjLvysLl20=
X-Gm-Gg: ASbGnct/AiI9/d0LxMe4FguGf8hltvXEon9/5wvoYLtMOifikL5HFsRXlydEK4LWr5T
 hlSzweNvaRLQTf5keoG1NxylT1O9/l/Oq1NC+S3xcAzeAP5UZWgIBzSP0+GR5mMJHyIv9i+0ICO
 2KpNeToMy8+KId5EKVXYZoFIAV0Gj8vzMol6m6Xqw6YfBb7VVjRLLIwb53nI3zt7I/3HHIRiwBc
 C1h9hdmXbLBO6ZAhShrrYMTlsEzJIaRAG6BhW6qnfmbXw9oCh3Q/fVM0VXFQxPFe2fZGvNitM6p
 eteGs/HHuR/1KBc740VLtGkx3YmzNZlCJ+wwZ1mIS+A=
X-Received: by 2002:a05:6000:4b1e:b0:3b4:b4d:6861 with SMTP id
 ffacd0b85a97d-3b60e50fe9cmr4084176f8f.27.1752733649843; 
 Wed, 16 Jul 2025 23:27:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUa4aOXbChYUxWv8JWA15fCsaQUq72srX4VLGiAhq9NwptUicuvnABzKx0c9GffdNfBTkSmQ==
X-Received: by 2002:a05:6000:4b1e:b0:3b4:b4d:6861 with SMTP id
 ffacd0b85a97d-3b60e50fe9cmr4084160f8f.27.1752733649446; 
 Wed, 16 Jul 2025 23:27:29 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.73.155])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e0d719sm19981527f8f.54.2025.07.16.23.27.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 23:27:28 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	manos.pitsidianakis@linaro.org
Subject: [RFC PATCH 0/4] rust: use attrs crate to parse #[property]
Date: Thu, 17 Jul 2025 08:27:23 +0200
Message-ID: <20250717062727.305466-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RY7MRbBulUbpWaPeEVuVUt4s9FF8V1NANgajoVGCync_1752733651
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

This needs a bit of preparation, but it simplifies the handwritten parsing
code down to approximately 10 lines, and slightly improves the error
messages too.  All the scaffolding will be shared by future uses of
procedural macros.

Thanks to the author of the attrs crate, Aatif Syed, for accepting to lower
his crate's minimum supported Rust version to 1.83.

Paolo

Paolo Bonzini (4):
  subprojects: update proc-macro2 and syn
  subprojects: add attrs crate
  rust: qemu-api-macros: support matching more than one error
  rust: qemu-api-macros: switch #[property] parsing to use combinators

 rust/Cargo.lock                               | 19 ++++-
 rust/meson.build                              |  2 +
 rust/qemu-api-macros/Cargo.toml               |  1 +
 rust/qemu-api-macros/meson.build              |  1 +
 rust/qemu-api-macros/src/lib.rs               | 84 +++++++------------
 rust/qemu-api-macros/src/tests.rs             | 14 ++--
 scripts/archive-source.sh                     |  2 +-
 scripts/make-release                          |  2 +-
 subprojects/.gitignore                        |  5 +-
 subprojects/attrs-0.2-rs.wrap                 |  7 ++
 .../packagefiles/attrs-0.2-rs/meson.build     | 32 +++++++
 .../packagefiles/proc-macro2-1-rs/meson.build |  2 +-
 subprojects/packagefiles/syn-2-rs/meson.build |  2 +-
 subprojects/proc-macro2-1-rs.wrap             |  8 +-
 subprojects/syn-2-rs.wrap                     |  8 +-
 15 files changed, 111 insertions(+), 78 deletions(-)
 create mode 100644 subprojects/attrs-0.2-rs.wrap
 create mode 100644 subprojects/packagefiles/attrs-0.2-rs/meson.build

-- 
2.50.1


