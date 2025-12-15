Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD946D59D99
	for <qemu-rust@archiver.kernel.org>; Mon, 15 Dec 2025 07:50:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vV3LS-0000XS-7b; Mon, 15 Dec 2025 02:50:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vV3LQ-0000UX-FY
 for qemu-rust@nongnu.org; Mon, 15 Dec 2025 02:50:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vV3LO-0000j7-2c
 for qemu-rust@nongnu.org; Mon, 15 Dec 2025 02:50:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765785009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nDqBb+howVc6cd7uGoknJH0PjirYFJJey/1eAuvkVIA=;
 b=ayw4Jh+Gx9RVxagfqlY58W0twyzj1yzg0UW64PNoABFcbWk//UoEZXqL0vTgVmOIMOA5Yy
 b+IJvRtS7pHtIBMfdJkm0DCFcUfwd9lQbjbIYXLdOg43KajZkIWRss1xZAPvqT0WQPW0yo
 TkyQpgAQZ6KKf0yavhSJ37U+EYlGSRA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-59-J_8zDk1OODKeuJgbftY7QQ-1; Mon, 15 Dec 2025 02:50:07 -0500
X-MC-Unique: J_8zDk1OODKeuJgbftY7QQ-1
X-Mimecast-MFC-AGG-ID: J_8zDk1OODKeuJgbftY7QQ_1765785006
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-47904cdb9bbso23912925e9.1
 for <qemu-rust@nongnu.org>; Sun, 14 Dec 2025 23:50:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765785006; x=1766389806;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nDqBb+howVc6cd7uGoknJH0PjirYFJJey/1eAuvkVIA=;
 b=e3cChqdCTgUgSd1VH2EPbkBRbxPNUGyJKYunVMn1eI6SjgTm+fKWhIQhcwJwwtJ8Nq
 lvoh0NrK/zWV9HDjWNarQavc0CPsCNZszk2LoEwDtSr/ASIqMVU/i18K08wWDUCW5Sen
 9hrVY2YCKZYR0tx1dI02cX5/eGjuFfX3wjOq/3aKaX0AIZX1ZZedtAUe4JP4pM4I0X6Q
 STNaF8YjuZPIdRdOxf0QYcPowejUVNMAlWb9P/EB/0HmxWc8ClJhTXagnDH40Zo3d7LI
 +JOHyMuluNGEnC9sNHyhuK8Zq5OxGSksOTdJ1H9L0daTAxRuBOlOj5hnQtBj7XivLcJr
 v5zg==
X-Gm-Message-State: AOJu0Yxi7REqizo1Q6fvnbJwwM4WMK14IRQa20wNYlbXmM6k42vAKKgZ
 1Kjuf+za7JxU0R8a1yCgkCNZVYY+3aqXFlTZ0kvnulyYzBeF9r6ThJS47WfH0mv7UnaKtd6DEfb
 /FbdncwxKuBw/5CcNPNJTQxhTC5a7vHQyY0CiK/GKFX4htG25YHNhrlk=
X-Gm-Gg: AY/fxX6Yrro7hR/Hjw4bFLgo/4M9Mep0yT1lq2TkIXdrP9MfVfcsFVEP744NbhWyjYH
 CsdnnIh7jrt9YXnrrw/gz/oG2XUKzoBsM3QNpv29st3UjfxjHTBbV8etcaAwF7vcAGbiRGiyHml
 IoI/jKiI0k8wLueTKYHrTcaZTxtGbHnh5W9zPTL+aEP1MLaXLRokZtVRX0KYe6zUh+ZaOHpZ/yS
 ItShoFyQffMLZCEuInOywz8zGeWXvQFKoZ2r83ORxYnlOEhzlWqcwkCFITrLXHu4ra+2YrusVVz
 Z1qXUkSItdn2XDc0OFYerxNqPh27RuArCL0S3ozIlX4kQyFX6fKVA0jyF0tpwjHl75FgS0iZU79
 2MsAUsukhp6ZvFdYH/WZj/dnqIY2LBtNqCy5mYIRpdyga0SlZRnb1/qQ6U1bExBSG4H2CfWEySY
 Hrnl0rvlxjNt9G1cc=
X-Received: by 2002:a05:600c:64cf:b0:479:255f:8805 with SMTP id
 5b1f17b1804b1-47a8f094212mr102922205e9.4.1765785006274; 
 Sun, 14 Dec 2025 23:50:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGK5Tx7FwVTie0aYHr7X4g2Hd6jxuowd5CtqTlTxD975RhZae7JhLVuvENqmdxDLBd482PFmw==
X-Received: by 2002:a05:600c:64cf:b0:479:255f:8805 with SMTP id
 5b1f17b1804b1-47a8f094212mr102921985e9.4.1765785005828; 
 Sun, 14 Dec 2025 23:50:05 -0800 (PST)
Received: from [192.168.10.48] ([151.95.145.106])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f6e58c1sm169877695e9.12.2025.12.14.23.50.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Dec 2025 23:50:05 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	marcandre.lureau@redhat.com
Subject: [PATCH 02/11] tests/meson: do not reuse migration_files variable
Date: Mon, 15 Dec 2025 08:49:51 +0100
Message-ID: <20251215075000.335043-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215075000.335043-1-pbonzini@redhat.com>
References: <20251215075000.335043-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RzAbA6OPx4x6yTB0BwjQ3OMZ_Lf9tZKAFeHdlNwWItw_1765785006
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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

The variable is defined in migration/meson.build, reusing it is confusing.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qtest/meson.build | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 669d07c06bd..08fba9695b9 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -343,7 +343,7 @@ endif
 
 tpmemu_files = ['tpm-emu.c', 'tpm-util.c', 'tpm-tests.c']
 
-migration_files = [files(
+test_migration_files = [files(
   'migration/bootfile.c',
   'migration/framework.c',
   'migration/migration-qmp.c',
@@ -377,7 +377,7 @@ qtests = {
                              'migration/migration-util.c') + dbus_vmstate1,
   'erst-test': files('erst-test.c'),
   'ivshmem-test': [rt, '../../contrib/ivshmem-server/ivshmem-server.c'],
-  'migration-test': migration_files + migration_tls_files,
+  'migration-test': test_migration_files + migration_tls_files,
   'pxe-test': files('boot-sector.c'),
   'pnv-xive2-test': files('pnv-xive2-common.c', 'pnv-xive2-flush-sync.c',
                           'pnv-xive2-nvpg_bar.c'),
@@ -389,7 +389,7 @@ qtests = {
   'tpm-tis-i2c-test': [io, tpmemu_files, 'qtest_aspeed.c'],
   'tpm-tis-device-swtpm-test': [io, tpmemu_files, 'tpm-tis-util.c'],
   'tpm-tis-device-test': [io, tpmemu_files, 'tpm-tis-util.c'],
-  'virtio-net-failover': migration_files,
+  'virtio-net-failover': test_migration_files,
   'vmgenid-test': files('boot-sector.c', 'acpi-utils.c'),
   'netdev-socket': files('netdev-socket.c', '../unit/socket-helpers.c'),
 }
-- 
2.52.0


