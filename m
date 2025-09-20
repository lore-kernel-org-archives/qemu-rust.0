Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDAECAC5A5
	for <qemu-rust@archiver.kernel.org>; Sat, 20 Sep 2025 14:31:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1uzybL-0007Fw-Ps; Sat, 20 Sep 2025 10:30:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uzybJ-0007ES-C2
 for qemu-rust@nongnu.org; Sat, 20 Sep 2025 10:30:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uzybG-0005Jw-FM
 for qemu-rust@nongnu.org; Sat, 20 Sep 2025 10:30:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758378603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RXUdmalvHm+5/GVcC2GTT1297p4snx3KOMpnEPeu9zw=;
 b=alzmlTgRlhgpkigHYRKNQbuHkgH+pUUyBODNb2u7wMmn52MMR1NWNz5SwdpMeHx5G5Fn4P
 VSd7g3qP1zNZFhAntVjTr9QIjblV17CoT3VRYJmSPs03IaKDYAFSpNSaKm4tQK2b0DnCGH
 JFOGny+R4BSIs68bTEqFEg/okBlY/ok=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-228-l2LcQS_rOdyKKwFJ3dPCHw-1; Sat, 20 Sep 2025 10:30:02 -0400
X-MC-Unique: l2LcQS_rOdyKKwFJ3dPCHw-1
X-Mimecast-MFC-AGG-ID: l2LcQS_rOdyKKwFJ3dPCHw_1758378601
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-45f2a1660fcso28087665e9.1
 for <qemu-rust@nongnu.org>; Sat, 20 Sep 2025 07:30:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758378601; x=1758983401;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RXUdmalvHm+5/GVcC2GTT1297p4snx3KOMpnEPeu9zw=;
 b=BBfQYCCQRgXEdaDjhGT3sZTE3y1uUAtClT4YenHPzwisk6C9WqgXXmB4hs2iHkIJVc
 YOq/ey/OuFgodJAmLFe809HCwivqDF3A9XUv+ibaVw5FMYpBVpFR/50EElbKwWCFNQfv
 i7Xy9WYZPMGtzmOY3n4dHLZibh5x51aWNXEjkWXIHr/mdGQLjxu74e4koXtSkBvz0uJm
 gDb+plRfqrxpQt4R7ZBn/n9vwnPR3Ckt2YI1mce4iGWZgA8YUDeN40YU1ypf2u8HbNCh
 I96tfZy+fK/vTov+TdLJR0OP/LtHq0+OMqFKL3Vj8QtpP69nv90Zt636P+vwIw5o/zF9
 3CfA==
X-Gm-Message-State: AOJu0YxHeas0tXz662D6gJUCPjzz8VVh/qRs0TsnqOQuKNED0INulngU
 /QguPKcFRkEv2NduDxVIXEC0Az0sWMP1csDB+PMzrGW9q6ez5PMBTjA1DLA2o4mZ4i+rkr/fdO+
 xL7pkmihSR5+NHY7V5sjhPYsfz3/jG6A0iqPcneHf/VSTjwQ6YgZLsyg=
X-Gm-Gg: ASbGnctxAlCc3Y5tEisTLthzDw4DZqFkKWSEDTsTMI2S4QvC9g24QEMPxrR5sATYUx8
 CdF6zK3cpdQxIEU3xsbu4g5ZKHEw3m2MUxrLmRp/X04klcEB41zqPnu4AvU+XdISoPiZDvuKofN
 IubPKwSHbwUU6qOUO2qUeuKEB9UiN5Ggp467AU2G7dFw6kufKqT4gnSdp1IEG02dbDoZQpDWJGU
 EsCs9htv/CmzFaTNRCZaOofQDQ737dg8C0dJlyqZqT1Ux/+VAe3AkFD86IsXBguDD2VTuXDJrUQ
 TZY7zNiNULl1wQ1iH7ZMLDZt+qcRjR2nAuWae3lsxpn3WRGroCUPsr1y6I70oXcxOu9YLcpnl7x
 b7r6HYxKuKJUTGU0G004KyuHBV4DGDFN3aykCgDW6tzg=
X-Received: by 2002:a05:600c:3b26:b0:45d:d6fc:24f7 with SMTP id
 5b1f17b1804b1-467eaa86ec8mr52767745e9.32.1758378600676; 
 Sat, 20 Sep 2025 07:30:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCrUkp3V8CjdTu4EsyiVArwCL6I/AP7qbQj/vHr08l9AjYtRZnxN+l1Ek4Cd/kIiDgh7qnOQ==
X-Received: by 2002:a05:600c:3b26:b0:45d:d6fc:24f7 with SMTP id
 5b1f17b1804b1-467eaa86ec8mr52767635e9.32.1758378600259; 
 Sat, 20 Sep 2025 07:30:00 -0700 (PDT)
Received: from [192.168.10.48] ([151.95.47.123])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3f0e28c83d6sm6447154f8f.56.2025.09.20.07.29.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Sep 2025 07:29:59 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, zhao1.liu@intel.com, manos.pitsidianakis@linaro.org
Subject: [RFC PATCH 0/7] rust: migration: add high-level migration wrappers
Date: Sat, 20 Sep 2025 16:29:51 +0200
Message-ID: <20250920142958.181910-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bqDb4iByk4CKwUJe6Lt8lWBMY9AO8w_9S9zP6jK0S5Y_1758378601
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.045,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

This series adds high-level wrappers to handle migration state; they consist
of a Migratable<> type that implements the snapshotting technique mentioned
at KVM Forum.  The concepts are also discussed at
https://lore.kernel.org/qemu-devel/8076a298-1cd9-4c90-a64c-f65004753975@redhat.com/T/

The wrappers (should) make it possible to easily implement migration of
thread-safe devices.  I say "should" because, even though there are tests
included in the series, they are anything but "battle tested".  The first
device to use this will be HPET.

This is an interesting step in enabling usage of Rust in QEMU; instead of
just wrapping existing C APIs, it provides a new interface that deals
better with unique features of the Rust language.  In other words,
something like Migratable<> and ToMigrationState might hypothetically
exist even if QEMU was written in Rust from scratch.

Paolo


Paolo Bonzini (7):
  rust: bql: add BqlRefCell::get_mut()
  rust: move VMState from bql to migration
  rust: migration: extract vmstate_fields_ref
  rust: migration: add high-level migration wrappers
  rust: qemu-macros: add ToMigrationState derive macro
  rust: migration: implement ToMigrationState for Timer
  rust: migration: implement ToMigrationState as part of
    impl_vmstate_bitsized

 rust/Cargo.lock                         |   5 +-
 rust/bql/Cargo.toml                     |   3 -
 rust/bql/meson.build                    |   1 -
 rust/bql/src/cell.rs                    |  25 +-
 rust/meson.build                        |   2 +-
 rust/migration/Cargo.toml               |   2 +
 rust/migration/meson.build              |   7 +-
 rust/migration/src/lib.rs               |   5 +
 rust/migration/src/migratable.rs        | 469 ++++++++++++++++++++++++
 rust/migration/src/vmstate.rs           |  44 ++-
 rust/qemu-macros/src/lib.rs             |  88 +++++
 rust/qemu-macros/src/migration_state.rs | 296 +++++++++++++++
 rust/qemu-macros/src/tests.rs           | 112 +++++-
 13 files changed, 1034 insertions(+), 25 deletions(-)
 create mode 100644 rust/migration/src/migratable.rs
 create mode 100644 rust/qemu-macros/src/migration_state.rs

-- 
2.51.0


