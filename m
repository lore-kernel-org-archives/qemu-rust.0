Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED738D11183
	for <qemu-rust@archiver.kernel.org>; Thu, 27 Nov 2025 13:22:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vObwC-0006pb-VU; Thu, 27 Nov 2025 08:21:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vObvb-0005VX-R0
 for qemu-rust@nongnu.org; Thu, 27 Nov 2025 08:20:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vObva-00026C-F7
 for qemu-rust@nongnu.org; Thu, 27 Nov 2025 08:20:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764249653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oHu41Oa/q8GhaKEt1sOE2Bq7H77riGl0nC0M3nPlAeI=;
 b=KrzNH0Ly312CvQpdo57BjLmYvFu8JZiYUGVYO6pnWV6+iSTj3JYO6Z4WJtj/Y3prFmM2nR
 s7pDuJxQQBun1/GR1xGs97M4NxRJg/UrlTi8GLhOLfvuX39dwXjQsX2C6wh4Rw8XwULtZZ
 ZeJJPekB1s2/Z/wlTNt/pWaGkaa+Nlw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-112-NuKIz8Z4MfibVgjxXh-ftQ-1; Thu, 27 Nov 2025 08:20:52 -0500
X-MC-Unique: NuKIz8Z4MfibVgjxXh-ftQ-1
X-Mimecast-MFC-AGG-ID: NuKIz8Z4MfibVgjxXh-ftQ_1764249651
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-640b06fa998so845773a12.2
 for <qemu-rust@nongnu.org>; Thu, 27 Nov 2025 05:20:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764249650; x=1764854450;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=oHu41Oa/q8GhaKEt1sOE2Bq7H77riGl0nC0M3nPlAeI=;
 b=T8cpjGRX4RlB6bSlm9DxwmgUXy1Mwab5Jn3yhrjpt61iITzC+r4GpxBIQxAQOt5mBO
 h8s+aoesogwr3FKutnOMzImqjG82gYYRxuy8qcBTqJd9T1CQEe7nKyMB7RkHd5IkdrTQ
 9ChnUb0Ek1xTs3UQJ6h4iEiRKmuVcjKsmotJhOQPBaAlNyaUrItJOXs1AWNcYKLFuCVy
 l5FKbMtlNEMCSZmVR83x7hms1x7K/EQLUGTdzUelN9zi/U68cvrXrSgsSAM3Rdw/9aKp
 rVBuCY/9fKcsyEER5SGiLpxusXA4T6PxOAQlLIdGl9hcZaW1AliE5yrp+BtltO+MywTN
 57gA==
X-Gm-Message-State: AOJu0YxIKY0VT9/es+Zrej6tEheiL/gitW2D84GDca9DkLtmZivBcp7X
 uFrfibwO8Qikupi+apoqkzVpyERQbfR/NdqXZPRXl0mv3lXZKydf+RqbaHoxmmRqr2OqN0q5Unn
 WF1J48aykwKfYtLLdOjetvmuvCc9PZdHI9k5yyisRgTW4Rv5wssduuJcWjpoDyBI=
X-Gm-Gg: ASbGncsTTrRoOcBFHRgGbkq3KDfIzPgzny6hkov65wlMLy9l1kC6FN3nY+CUbuXWB5I
 FjH8I0VPyL649GqY8Yt1/soktgS5ShYlSKbJ2nbe69BJb01j8+BO8yuw0BQaYq8tYFCtUss39J9
 rW3GGk9CxAqqihrUW/tkUdf1qfQyoM76rKv8aN2BVMAtXMyz+2YNO5NvE0qfix0+bew5xYqQVXW
 0V65Ost9P4wt63rj3a3y04vL0KHkEfLBwc0oe9Mg/FG6xUEyWXVHlzbkIOjPvujcwLuAR7iKUiz
 oGFjWIdWHxi8j54kwDQBaOPGDXP3BEdfYaDwO8TmhMF2BzORjq3Z8fE3CXmqN25ewKC7cF3jtuN
 OtuOZitGU10Fy/VQIvSnb3GUBH50niwTUK5p0gHWw6NYB8J4KfJWOGL69e1C3ZqqBcXUJ6ubUQP
 3WO3gANHFIQIw8Po8=
X-Received: by 2002:a05:6402:2816:b0:640:93b2:fd1e with SMTP id
 4fb4d7f45d1cf-64555cd8cc4mr21660351a12.17.1764249650367; 
 Thu, 27 Nov 2025 05:20:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4X2jw7lKUrC0VSwQWqFLab02VMT9E/qXYgLu35Aos+c181UH6b58dTLOfMnS++mkvY5wIPQ==
X-Received: by 2002:a05:6402:2816:b0:640:93b2:fd1e with SMTP id
 4fb4d7f45d1cf-64555cd8cc4mr21660325a12.17.1764249649989; 
 Thu, 27 Nov 2025 05:20:49 -0800 (PST)
Received: from [192.168.10.48] ([176.206.119.13])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64751062261sm1735825a12.33.2025.11.27.05.20.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Nov 2025 05:20:48 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 5/9] rust: do not copy the SysBusDevice
Date: Thu, 27 Nov 2025 14:20:32 +0100
Message-ID: <20251127132036.84384-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251127132036.84384-1-pbonzini@redhat.com>
References: <20251127132036.84384-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kZpv9i7JIKnGgujsHQ5Z_BRtdyWE4Oeab6OriLYJJoI_1764249651
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.224,
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/core/src/sysbus.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/hw/core/src/sysbus.rs b/rust/hw/core/src/sysbus.rs
index 68165e89295..ec620639be5 100644
--- a/rust/hw/core/src/sysbus.rs
+++ b/rust/hw/core/src/sysbus.rs
@@ -78,7 +78,7 @@ fn mmio_addr(&self, id: u32) -> Option<u64> {
         assert!(bql::is_locked());
         // SAFETY: the BQL ensures that no one else writes to sbd.mmio[], and
         // the SysBusDevice must be initialized to get an IsA<SysBusDevice>.
-        let sbd = unsafe { *self.upcast().as_ptr() };
+        let sbd = unsafe { &*self.upcast().as_ptr() };
         let id: usize = id.try_into().unwrap();
         if sbd.mmio[id].memory.is_null() {
             None
-- 
2.51.1


