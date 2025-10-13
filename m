Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3148CCD18D
	for <qemu-rust@archiver.kernel.org>; Mon, 13 Oct 2025 16:53:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v8LnE-00028D-JS; Mon, 13 Oct 2025 12:53:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v8LnC-00027r-M4
 for qemu-rust@nongnu.org; Mon, 13 Oct 2025 12:53:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v8Ln9-00089e-Uk
 for qemu-rust@nongnu.org; Mon, 13 Oct 2025 12:53:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760374377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9ROpKTB+0L5bDWmD9B011KEbtMbuEJDM80v6afnyP4o=;
 b=XGszDNT03tVvmm93EgowWOJIl5H/5nZ1zyrxJzRRKrsishQg6LJ+PQtiXSHpvSfhXx73/x
 kNPSBrFetliMI2iS92ioa/Jh3Zw/6Xwt+td+cTHhhgTBWK5ea9lIYT0vJ3bLzcOw+ejScy
 EUQNTSJnyT3y7MDhOsdniksv00JVnbM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-39-P2AJonNHOiGjZBbUydHK_w-1; Mon, 13 Oct 2025 12:52:55 -0400
X-MC-Unique: P2AJonNHOiGjZBbUydHK_w-1
X-Mimecast-MFC-AGG-ID: P2AJonNHOiGjZBbUydHK_w_1760374374
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-46e2c11b94cso30941705e9.3
 for <qemu-rust@nongnu.org>; Mon, 13 Oct 2025 09:52:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760374373; x=1760979173;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9ROpKTB+0L5bDWmD9B011KEbtMbuEJDM80v6afnyP4o=;
 b=dkLnF0YRefPG2PwHaIZ1fwU3b0bBuAcqjiPaTRmqKGUrQxr37Mq/fVDCTrI+2LeluK
 896iAqNQKpnMMjMQNRKa+dqzoZRsvEZkUq9FFT2WAvk94Lum+viNS4FHyfvKzxErCF3Y
 MpR4RHwkOkIe/se965QyCK3tOD2E864oC8+WdcMjH6XvJ+Bz2Flz4jbii63G82oYbJEN
 gl/XGwQSHMPsFwxBD2goc/+AmN/vgz+oyFOo4XOXXyuJ8hiAKiwAQtvMeuQ5GrKZ2qfE
 MhJMX+nkd7/O/vpRbBw0k+waCpqlVSvvXDUQ91Ba1VP1RaHz3c4jVNmt4aedZXHN5Vfh
 qeag==
X-Gm-Message-State: AOJu0Yx0eB5V/1XZhWnfA01Z3DOoUVtw2YPB09u64nuJgIhDqU4AgDDf
 MxqXvVsYKARxFtu/enVLGBu8mMuEPYxKoELqF4A3v1QmPpZ1LJHqP2hKET3t5KpVl4pSmQ/4BYl
 BnS7XS6SDziGIDog0cAUbs4mtW18IlB0A+Q+laIuUisG386XFJfYw0qt3ZD96Li8=
X-Gm-Gg: ASbGncsV4Cz2Qkqmokt3zGN28vK7c21M6hxW1un1jBuNaUCLF9Y1jtcAOhHz+BINHcw
 NHQRmmqoZLv9JsrJjOww7/jkHOcg8uMuT2AgV3rpUV9U1KOpHJcgdfmk+v0i9ijNJnfOlSB2Nwb
 pLJ1OenfMvcVViHBGCHbyyhSYeMHogb4CDRWr4EZnTyKvZUhKgblDu9ba2ffgeSFtbFwgmKqOnz
 UwIQbU1xhGndNJjICjh7avhPGFd2MF6cTaEfMNpQZjL5kUGTr5eSRCeglJ0Vwznl4Gh1tscW1SA
 MnEz7UWDbIjGNm7s7Nu9vpPU3v8zp0ksBXILQM6j+ngHrshg2oMPiDKcVHtU5viUCyuq9Tqzi+v
 6JNQHv3wGWF/XHWCipNa+S9RVvTl00Nla9W3Obv3NMSI=
X-Received: by 2002:a05:600c:820a:b0:46c:e3df:529e with SMTP id
 5b1f17b1804b1-46fa9af9019mr156081425e9.19.1760374373528; 
 Mon, 13 Oct 2025 09:52:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTpbZjIFjvl/BR/8AmthcqfLW27tXPicAXur8epFXINsapt9qkmUPtId8LihZ62Iya+KCLKw==
X-Received: by 2002:a05:600c:820a:b0:46c:e3df:529e with SMTP id
 5b1f17b1804b1-46fa9af9019mr156081335e9.19.1760374373166; 
 Mon, 13 Oct 2025 09:52:53 -0700 (PDT)
Received: from [192.168.10.48] ([151.61.22.175])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb482ba41sm195893785e9.4.2025.10.13.09.52.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Oct 2025 09:52:52 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH] rust: hpet: fix fw_cfg handling
Date: Mon, 13 Oct 2025 18:52:51 +0200
Message-ID: <20251013165251.1004096-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wUDqjAPtC4vDCMKCHunYymS_Uq3avaJ5O1FDcU8etMI_1760374374
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

HPET ids for fw_cfg are not assigned correctly, because there
is a read but no write.  This is caught by nightly Rust as
an unused-assignments warning, so fix it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/timer/hpet/src/fw_cfg.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/hw/timer/hpet/src/fw_cfg.rs b/rust/hw/timer/hpet/src/fw_cfg.rs
index e569b57b93b..bb4ea8909ad 100644
--- a/rust/hw/timer/hpet/src/fw_cfg.rs
+++ b/rust/hw/timer/hpet/src/fw_cfg.rs
@@ -40,7 +40,7 @@ pub(crate) fn assign_hpet_id() -> Result<usize, &'static str> {
         assert!(bql::is_locked());
         // SAFETY: all accesses go through these methods, which guarantee
         // that the accesses are protected by the BQL.
-        let mut fw_cfg = unsafe { *addr_of_mut!(hpet_fw_cfg) };
+        let fw_cfg = unsafe { &mut *addr_of_mut!(hpet_fw_cfg) };
 
         if fw_cfg.count == u8::MAX {
             // first instance
@@ -60,7 +60,7 @@ pub(crate) fn update_hpet_cfg(hpet_id: usize, timer_block_id: u32, address: u64)
         assert!(bql::is_locked());
         // SAFETY: all accesses go through these methods, which guarantee
         // that the accesses are protected by the BQL.
-        let mut fw_cfg = unsafe { *addr_of_mut!(hpet_fw_cfg) };
+        let fw_cfg = unsafe { &mut *addr_of_mut!(hpet_fw_cfg) };
 
         fw_cfg.hpet[hpet_id].event_timer_block_id = timer_block_id;
         fw_cfg.hpet[hpet_id].address = address;
-- 
2.51.0


