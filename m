Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tneoT-0006wi-IT
	for mharc-qemu-rust@gnu.org; Thu, 27 Feb 2025 09:24:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tnemr-0004Q8-Ta
 for qemu-rust@nongnu.org; Thu, 27 Feb 2025 09:22:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tnemp-0004BA-VZ
 for qemu-rust@nongnu.org; Thu, 27 Feb 2025 09:22:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740666171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5YnANE3o7k98qiD5yXSXBYpiijAd3VVlrkAgduC094U=;
 b=cYPwZksvno9qcDiJi3ZgmVKcpkwfqL2SzyTp5Kise6YmsCzQhSj2DvNfi1d2/7iVJ2gswf
 B6BOSq5VhnXJIzCg+IAd+/tmqxDAlQlusS6mvZQqVs8XcRDf3qDb7P63F5r+cMmv6V/lm+
 fNdmfRjIFjPa4/rRjDk9cpdFKvXcX+o=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-135-hbx3XishOl-C155mU9LGew-1; Thu, 27 Feb 2025 09:22:48 -0500
X-MC-Unique: hbx3XishOl-C155mU9LGew-1
X-Mimecast-MFC-AGG-ID: hbx3XishOl-C155mU9LGew_1740666167
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-5e058037b27so1036169a12.1
 for <qemu-rust@nongnu.org>; Thu, 27 Feb 2025 06:22:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740666167; x=1741270967;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5YnANE3o7k98qiD5yXSXBYpiijAd3VVlrkAgduC094U=;
 b=NydamErK1gq4BJTRDul04Oxt0CiPc/TrW9crag5Atvo7jdywmU7iR3IF8PFFbb4EWv
 lbiA9KnnJ1uSPhofkA5dXKYE3kNcubUCCG8r5QOZIwcz/xc2Vc4s8QrIzeiSTh7S0Q2t
 IoK+wSJMQw7f8Pg+sXXGbrtv8KxShVXOu4svOCc698vWq1NobITTdNZprwxXxpbbhvie
 5t5fN9p/7yhelLwWMd3c2WYQsz9g1fEAidliRq1fNyOjAWNpww01NjjYDm9u8aCNLjai
 cKI8yGjlWW71mJ0c/KmaQ5br6+dTn57gC/uUMbh4Kz3WBllq1/Ytxd7qNQkIcLgNH9B9
 CnBg==
X-Gm-Message-State: AOJu0YzPCLRG4BlyNXwhv5TPw4BLSWkU9T0vW3GvNXaCObLD/4VfShye
 lRx88pC9QlDEo6UEB54XQQU09BpoxWNHdjyi32S4c3PBhO++ewLsVfch+WNI1jpBUrKSKfD/0vj
 HiL/WCLeZu4P7hKg0xsA2PlvwE0UKm8JuT571qOWAEfXfTAFw2XeNxHWIFOLObA==
X-Gm-Gg: ASbGnct/yx+5wUWd5nfYsXvB/hx0boE3oZe2PoLhUbZQby+Uq7xzDuG7J8PX3KRButd
 xXfS+/DrcAHwFgf+knxTYFl24kt3KHkG6wxiLncaj8dCEkmbSFf5ejvD9FxxWEu3njoGDz2zQw6
 8aPquvl8QvY+08u/mWv8uRg1Xd8qQw3tUinYtvr4GIUayAqnoc4XA8XSq+BhKJDKbzjGI2McAI6
 fBc7xtXDGH/7+HZomXbrkXoAEeR/jVSUplDs5SAhVq1rz2nnOAggC2mBfKd552RjegJJaL1Ps51
 eETEXkebjolJhDcJMVdZ
X-Received: by 2002:a05:6402:248c:b0:5da:d76:7b2e with SMTP id
 4fb4d7f45d1cf-5e4a0bf28cemr11014793a12.0.1740666166606; 
 Thu, 27 Feb 2025 06:22:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFI18O2SZf2XVwBJAzZdSiM75sskBvaScYSlzBp/K0tpUSEfcPx/7NIQUBZO265lJA9h0HCMw==
X-Received: by 2002:a05:6402:248c:b0:5da:d76:7b2e with SMTP id
 4fb4d7f45d1cf-5e4a0bf28cemr11014761a12.0.1740666166220; 
 Thu, 27 Feb 2025 06:22:46 -0800 (PST)
Received: from [192.168.10.48] ([176.206.102.52])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e4c3b4aa13sm1147054a12.7.2025.02.27.06.22.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 06:22:45 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	zhao1.liu@intel.com
Subject: [PATCH 12/12] rust: bindings: remove more unnecessary Send/Sync impls
Date: Thu, 27 Feb 2025 15:22:19 +0100
Message-ID: <20250227142219.812270-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250227142219.812270-1-pbonzini@redhat.com>
References: <20250227142219.812270-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: w5GSi_eb8g4m_LEHgDtpcYEb52FAjcTwoLxpQvAf2xc_1740666167
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.438,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 27 Feb 2025 14:22:55 -0000

Send and Sync are now implemented on the opaque wrappers.  Remove them
from the bindings module, unless the structs are pure data containers
and/or have no C functions defined on them.

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/qemu-api/src/bindings.rs | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/rust/qemu-api/src/bindings.rs b/rust/qemu-api/src/bindings.rs
index c3f36108bd5..3c1d297581e 100644
--- a/rust/qemu-api/src/bindings.rs
+++ b/rust/qemu-api/src/bindings.rs
@@ -25,15 +25,11 @@
 
 // SAFETY: these are implemented in C; the bindings need to assert that the
 // BQL is taken, either directly or via `BqlCell` and `BqlRefCell`.
-unsafe impl Send for BusState {}
-unsafe impl Sync for BusState {}
-
+// When bindings for character devices are introduced, this can be
+// moved to the Opaque<> wrapper in src/chardev.rs.
 unsafe impl Send for CharBackend {}
 unsafe impl Sync for CharBackend {}
 
-unsafe impl Send for ObjectClass {}
-unsafe impl Sync for ObjectClass {}
-
 // SAFETY: this is a pure data struct
 unsafe impl Send for CoalescedMemoryRange {}
 unsafe impl Sync for CoalescedMemoryRange {}
-- 
2.48.1


