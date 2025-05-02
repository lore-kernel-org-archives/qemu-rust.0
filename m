Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uAmGN-0006jM-2y
	for mharc-qemu-rust@gnu.org; Fri, 02 May 2025 05:00:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uAmGL-0006gK-6z
 for qemu-rust@nongnu.org; Fri, 02 May 2025 05:00:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uAmGI-0004xg-RI
 for qemu-rust@nongnu.org; Fri, 02 May 2025 05:00:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746176448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/IRAGOm/TB6BHj4C+HObeEmG8st+nADkj/KyPgOtSG4=;
 b=ZT4THTXQignzfeo1MlAxQr/qdEqIJEn3m0jDqNZKtJyMvgpwcTwknVwoMrQd7jmjfNFnLQ
 Jm0Qxi8GNlfBQJEbG7eSQuG4DLVKsKSN1WF4C7ZcVZvDt1S0AoMEqwE270X6BtSWi8k2Hb
 HZSk+bkK8EuYR5ARjDo06ZnxdYn9VCc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-274-SCrTWwGvOOKH2u5W7zVGPA-1; Fri, 02 May 2025 05:00:47 -0400
X-MC-Unique: SCrTWwGvOOKH2u5W7zVGPA-1
X-Mimecast-MFC-AGG-ID: SCrTWwGvOOKH2u5W7zVGPA_1746176446
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43f251dc364so9497705e9.2
 for <qemu-rust@nongnu.org>; Fri, 02 May 2025 02:00:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746176446; x=1746781246;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/IRAGOm/TB6BHj4C+HObeEmG8st+nADkj/KyPgOtSG4=;
 b=EoM/0FyICi8qjB5BZgMIsQTH421pFYp4X7yVgKhWGwf9r6RuKCy5AHPFboh4ak06gQ
 cxxt/IxAPHmo9AsJqJqHTVyED35OISrOe57WwHZW3oJIB/fRa4kiRAS6YIOpeY+mNbTO
 jCVEVvbJq6MgNR80p9DJbqkyGKFuizJk7/lqBMahCKffHbvSMHquzJZVBt55AeyqpqWe
 wRoDjx5NhkTG/0VTucD+9GbpDCSD52sgSUJ1XdRM/lnYAltp4h9Xn0Pkn9kHrjGLV9ti
 gD55tVvOSaFh6qY4zaILki1qtg+yWli72DijJ2ILgoaDJnFLZqU76RWT5JW3+MWbDZcx
 IomA==
X-Gm-Message-State: AOJu0YzNTyY8KtFqxIY6fjuUqlctckeTtbpA0/OPbV8qMFP8reMViGmU
 kDRKxpOtJ+/a44EcQgQ+Sf2VS45nzjC20Y3YtU8vVfHY1KTwx2wrnM4XbG/30D67TVhhOFKCUqs
 JQUaBysZnny5xDPP94RiTRuUeELd4Iw9xHioK2E7sks05pSFCGY4=
X-Gm-Gg: ASbGncvH2GiWJl+wRM9g3cbAKVEOcZiWZ9dMEL3rrT+6g7El1yOMa8QLTtwryc5KxYo
 qICfGcoBBzGLQsYlF/bPNKhY+vLn0sAT5pwJ3/Jxcp0mOzhziV94uUyXh3EPNJQwtYKVUTNnsLK
 EYMB5C38oXVRu/1YPQ/9CU41abXT1QqFD+0EP7I/3WcxAO94FUmdbn6txP2yRJ2rFDq7+ge/YSl
 gGW8RWl4CA94U42KhmD19VmP6GeWFF5cwWHKbD3msethpvFRncq3sA7bkfqcrqFSAS/tajT6UH3
 qGHwN/M5ye+dsNQ=
X-Received: by 2002:a05:600c:154a:b0:43c:fda5:41e9 with SMTP id
 5b1f17b1804b1-441bbf38455mr16298315e9.31.1746176446249; 
 Fri, 02 May 2025 02:00:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGy+VAbyM03A/TTCR54KVh9IdcpMhkvNlc75gIY0WGIPDXj1VG5S5Yxpb2rfREeTwbRmCiwNw==
X-Received: by 2002:a05:600c:154a:b0:43c:fda5:41e9 with SMTP id
 5b1f17b1804b1-441bbf38455mr16298005e9.31.1746176445901; 
 Fri, 02 May 2025 02:00:45 -0700 (PDT)
Received: from [192.168.10.48] ([151.95.54.106])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a099b10013sm1540043f8f.65.2025.05.02.02.00.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 02:00:45 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	zhao1.liu@intel.com
Subject: [PATCH 0/2] rust: vmstate: improvements to varray handling
Date: Fri,  2 May 2025 11:00:42 +0200
Message-ID: <20250502090044.85557-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9jmgvpbHcCzNkmHUKIutz6bOhpsc5XtmHfNIeHRjCnI_1746176446
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.644,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-List-Received-Date: Fri, 02 May 2025 09:00:53 -0000

Small improvements to vmstate.  The second patch is a simpler replacement
for https://lists.nongnu.org/archive/html/qemu-rust/2025-04/msg00018.html,
and is needed for HPET migration support.

I will include the remaining HPET migration code in the next pull request.
I have done some more experiments on Builder, but vmstate_fields!{} requires
the const_refs_static feature (which should not be a surprise...) and hence
Rust 1.83.0.  I will maintain the patches in my tree though.

Paolo Bonzini (2):
  rust: vmstate: support varray for vmstate_clock!
  rust: assertions: Support index field wrapped in BqlCell

 rust/qemu-api/src/assertions.rs | 25 +++++++++----------------
 rust/qemu-api/src/vmstate.rs    | 13 ++++++++++---
 2 files changed, 19 insertions(+), 19 deletions(-)

-- 
2.49.0


