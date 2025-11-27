Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E02D11183
	for <qemu-rust@archiver.kernel.org>; Thu, 27 Nov 2025 13:22:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vObwC-0006iN-92; Thu, 27 Nov 2025 08:21:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vObva-0005V6-N9
 for qemu-rust@nongnu.org; Thu, 27 Nov 2025 08:20:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vObvY-00025v-1W
 for qemu-rust@nongnu.org; Thu, 27 Nov 2025 08:20:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764249651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=isO8fa7O3c4qBfTQUgy/eZ5GTanVVaRH/3OOX9kLqXA=;
 b=SuzAwemnwFkOGmJNAVwIdkLvPtEFQUL26nflB6XXV/PMP8/iCZamQcCbC0GZpuoM3/Bf9b
 pFdYakLnVbQBTAoU4dQQnbfM2ey8eaWH9JaNa5mCr1MnHoTOdDojXHuWU2UDjb975sxWEi
 zhB2xtCfvNs8G4sJL6nYjH48O5RVlG4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-341--2NEzxdsMr2S-BI4QnfH6g-1; Thu, 27 Nov 2025 08:20:50 -0500
X-MC-Unique: -2NEzxdsMr2S-BI4QnfH6g-1
X-Mimecast-MFC-AGG-ID: -2NEzxdsMr2S-BI4QnfH6g_1764249649
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-b735efd650fso98408066b.0
 for <qemu-rust@nongnu.org>; Thu, 27 Nov 2025 05:20:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764249648; x=1764854448;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=isO8fa7O3c4qBfTQUgy/eZ5GTanVVaRH/3OOX9kLqXA=;
 b=M5bJUeAe5wpcOSwP3bexlIybS0x3k0yoZLiynmonOryAeo5/BvOeHkx3yid+r0XCS9
 w4/JOX5/YnjdnQI+OievxRgW/f/ZKARCcKYitRtyswWywtW92hanjpc1vUwWUO70vUQO
 LAppQ3I4BhmozRmHK5+u0u3RDmxzw/vdgrzQbvmUggxXWvOwYwNCKZsYDl3/sVAV0KNc
 s/5ZTwQ0SeagFF800C48FAaJ7glO6B71N51rqXRCiuUnTATWGzKUq1e+mQex0e0IZS5B
 Va9ETaftrtXGszsbyD8gLUHtH+qI1xtYDrlZF+uIEt9ZSi+XFlLsThg3mrfthbtXr+rF
 2+vQ==
X-Gm-Message-State: AOJu0YzD4+y4mJYYIXAiaMAsTzbMGuUbbjkgh/kTxa1Uz60KdIfOxNP/
 74j0adODLWkvUAFlkRGJZ5yZz8ulTZ/2bLthEaYaCwW6TlzuvSkbuYvr7iZlysano797e5ESkB1
 Jb5bH7wg3pnIEAk19tNe7X0qRap52D9A3R1gwtZKd1Ln65438ZOkLR5bmrTLiTgY=
X-Gm-Gg: ASbGncv7+zzguwFYtFxpuwqVm5L+cPkXAdZWazCDX+NUrfAqshiQnwqNbP75iXpLy7Q
 ECwaI/sHg8JXR31zKNCwEWaAVDqvXbS/1d9mVE2r35LhG2FqFLP06lGOyK+sbKZcEOf/EKz2D0K
 b7PHUb/mxPJhnn1/ySVRW4UGWzJ7P16uUwxVd+onfk63bXbCrZypFE8g9dQATrWSdXlL3nuo0F1
 o6Hz+xyq5xNo4hrXM2ugpfUjoSqSLEjJeDNFhmtsA4LpdL0t1j+QkVpCFtSEkK8vjdvVgmT7OVR
 +CMbzc6aFdk+TVs1TwRQMkZiklYfLKqsJHGtge5KBWyRfKgfU0tL9d9ZO2s4gQ3pi9u55cC4y59
 RDV0FO0HGFd7AdbBQMApTqoY/twBCq+flzagcrT63tnulxqrs1FJDaG9QF9jOOEIdVnxl5mFSo+
 pXkM7goAtBP7/5Ihk=
X-Received: by 2002:a17:907:72c2:b0:b71:29f7:47ef with SMTP id
 a640c23a62f3a-b7671b50083mr2523412466b.61.1764249647894; 
 Thu, 27 Nov 2025 05:20:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHduIIPVflFvWbNu/AZ34V1zSPZQ34GTNbBQlkL01K9Sx9DaVcBqCjb3AXVG16DZAv3yyCx7w==
X-Received: by 2002:a17:907:72c2:b0:b71:29f7:47ef with SMTP id
 a640c23a62f3a-b7671b50083mr2523409466b.61.1764249647514; 
 Thu, 27 Nov 2025 05:20:47 -0800 (PST)
Received: from [192.168.10.48] ([176.206.119.13])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64750a6ea41sm1586055a12.7.2025.11.27.05.20.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Nov 2025 05:20:44 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 4/9] rust/bql: make bindings public
Date: Thu, 27 Nov 2025 14:20:31 +0100
Message-ID: <20251127132036.84384-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251127132036.84384-1-pbonzini@redhat.com>
References: <20251127132036.84384-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NCZyAq7TKnLx9QiPylmxober--XrthRl8n4p92pyFms_1764249649
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.224,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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

For consistency with other crates.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/bql/src/lib.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/bql/src/lib.rs b/rust/bql/src/lib.rs
index ef08221e9c1..2cdc551e21e 100644
--- a/rust/bql/src/lib.rs
+++ b/rust/bql/src/lib.rs
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
-mod bindings;
+pub mod bindings;
 use bindings::{bql_block_unlock, bql_locked, rust_bql_mock_lock};
 
 mod cell;
-- 
2.51.1


