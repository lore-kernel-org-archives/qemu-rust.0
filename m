Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A7BD1F9B5
	for <qemu-rust@archiver.kernel.org>; Thu,  4 Dec 2025 10:50:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vR6un-0002BU-Cj; Thu, 04 Dec 2025 05:50:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vR6um-0002B9-FY
 for qemu-rust@nongnu.org; Thu, 04 Dec 2025 05:50:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vR6uk-0002Ch-Tz
 for qemu-rust@nongnu.org; Thu, 04 Dec 2025 05:50:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764845421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=i2L2bDIgJyo5amVCwiaT61QyiIDHFyCTXAFJ7ANy4bs=;
 b=Wf+WPrrL0kC4Auc8ZMNgA2v77TFUlbu8NmySygH0JmHW/iGH697tvJKCROvAa0FXVvQLe+
 Z3w0mFqrjrbRWan1exP/s36SGltvOV5mmVqptB5OoxFZ/2zReNqn49R4+Y40G9d3mngdKt
 dDhTD6cHNUyB/anKcfEOEmBTbYRRJL4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-197-LHQM0b6uM8K8OMNzKqFdxg-1; Thu, 04 Dec 2025 05:50:20 -0500
X-MC-Unique: LHQM0b6uM8K8OMNzKqFdxg-1
X-Mimecast-MFC-AGG-ID: LHQM0b6uM8K8OMNzKqFdxg_1764845419
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-42e2d5e833fso429546f8f.1
 for <qemu-rust@nongnu.org>; Thu, 04 Dec 2025 02:50:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764845419; x=1765450219;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i2L2bDIgJyo5amVCwiaT61QyiIDHFyCTXAFJ7ANy4bs=;
 b=o0DF6aIXqEzvv6nIWxcusrMj4p7JqGNjubvC3FjrrbwhnZe1gGWIS2VmQ7s90TJcH3
 eOPx1uDqlYgnDOTHsVKTjqtDKbsHUt+HZHUfB22On4RYrcALxrRYXI82gvB6k7HBwfja
 jjeOGHdc4IS6CA7Jjhg+NjRd5INviWfZmAepZNIEOBdT+3zw3l/64SZTwBp+19BYxqkm
 wJ2AL+POv+A/sl+UtJgZm3/Pku4iKnD9/N2W7SwVqMbFcu+hq9xQVXOZDkvEVTcz6ste
 5bK0eQKQV2ed1qnIWd1mSVylnjN7LZNLSnEIm3wLFPueLKZCg1FjBT9ojHWIjg/jZ6O1
 uQjQ==
X-Gm-Message-State: AOJu0YwYxUofchSRDjsg/D3AoEr2gNl0p8Di3/+K/sm8ygpZyVBF3YKX
 NRYLI6PeC7epJIxfKIuxxzkwmo1+ml9xGKdbk4MioDAvPFtJagO9prl1VXob/b9Ve9NFYlCtIvR
 PF/xsMaUDQzN927rlKjsE87iplNZ1GQbDUQDUqtGsh8kko78DsFbmZ+Y=
X-Gm-Gg: ASbGnctCK6XTaVkIqmaf0PQZ9x26BVrMNN0QN6LFmxsBYAimvmxb0SIcnamNFQXKePL
 tiGJF/e7mIRQpK7UMT24vEgi8uAvchY3l48owl5ducoZlS3tBOh6asDIqn2aKPsyGKRNgk3C13G
 lpBJPNglF4IfdQV6s2u6+8pMMA8KX3bk5vL2pug281EwFSnDeTAOR1kY5MkSP3+C65e58VbN4zi
 BdxWXo6bZoMJtVWpB97nPXWJHfrgJXXjhGPV2qb2HBTa8B+iKYVmWy1pQ7WQ/1q+kT92a7BIIJx
 9diSj7JYTT891fdiLfxkc7143crfw4F0/UH1IiYpJ9Sa9COKHLnL/UcSbpxk0nhJDlJYjDlvYHb
 x48IsEKttL6LZxbMGhliB1KracN9J85SR55y4VTD/VNG/FYP0K+M4JKxsRAzt2OBp/HS8wei2Oj
 +4yraKuFjse+KhIBM=
X-Received: by 2002:a05:6000:c0b:b0:42b:3eb2:1b97 with SMTP id
 ffacd0b85a97d-42f731905a9mr4635234f8f.9.1764845419304; 
 Thu, 04 Dec 2025 02:50:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGDKn6k/gpAIcrJEUW+zOk2+lqPffW0oRy2X2l0v6uJLA8SVYJGfQjNXnX1w+WnrsPN5Wj8Eg==
X-Received: by 2002:a05:6000:c0b:b0:42b:3eb2:1b97 with SMTP id
 ffacd0b85a97d-42f731905a9mr4635216f8f.9.1764845418878; 
 Thu, 04 Dec 2025 02:50:18 -0800 (PST)
Received: from [192.168.10.48] ([176.206.119.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d331aeasm2455317f8f.37.2025.12.04.02.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Dec 2025 02:50:18 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH] rust: hide panicking default associated constants from rustdoc
Date: Thu,  4 Dec 2025 11:50:17 +0100
Message-ID: <20251204105017.2564277-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZdPjFR8_zAek2aM-0B3B20ii-09lndS1fS5wbJ20vIw_1764845419
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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

Work around rustdoc issue that panics while trying to evaluate
the constants.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/core/src/qdev.rs      | 1 +
 rust/migration/src/vmstate.rs | 1 +
 2 files changed, 2 insertions(+)

diff --git a/rust/hw/core/src/qdev.rs b/rust/hw/core/src/qdev.rs
index 4e983da28b7..c2ca17f6ce0 100644
--- a/rust/hw/core/src/qdev.rs
+++ b/rust/hw/core/src/qdev.rs
@@ -132,6 +132,7 @@ pub trait ResettablePhasesImpl {
 /// [`bindings::PropertyInfo`] pointer for the trait implementation to be safe.
 pub unsafe trait QDevProp {
     const BASE_INFO: *const bindings::PropertyInfo;
+    #[doc(hidden)] // https://github.com/rust-lang/rust/issues/149635
     const BIT_INFO: *const bindings::PropertyInfo = {
         panic!("invalid type for bit property");
     };
diff --git a/rust/migration/src/vmstate.rs b/rust/migration/src/vmstate.rs
index 267f9c8e053..f9d9f335b98 100644
--- a/rust/migration/src/vmstate.rs
+++ b/rust/migration/src/vmstate.rs
@@ -101,6 +101,7 @@ pub unsafe trait VMState {
     /// type for the length (i.e. if it is not `u8`, `u16`, `u32`), using it
     /// in a call to [`vmstate_of!`](crate::vmstate_of) will cause a
     /// compile-time error.
+    #[doc(hidden)] // https://github.com/rust-lang/rust/issues/149635
     const VARRAY_FLAG: VMStateFlags = {
         panic!("invalid type for variable-sized array");
     };
-- 
2.52.0


