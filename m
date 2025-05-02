Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uAmIU-00013z-TC
	for mharc-qemu-rust@gnu.org; Fri, 02 May 2025 05:03:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uAmIS-00012z-Sl
 for qemu-rust@nongnu.org; Fri, 02 May 2025 05:03:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uAmIQ-0005PG-VL
 for qemu-rust@nongnu.org; Fri, 02 May 2025 05:03:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746176582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/IRAGOm/TB6BHj4C+HObeEmG8st+nADkj/KyPgOtSG4=;
 b=dfgSEdgPXv4/wbzSoQJ3lgO8aUY0a+l2nOGF1xdbyr0lUkIp9jF5DxYFmHZbvPUngWpjr4
 FslZgX87Y2jqrTNaZM/1pygXHN+1XFbBHnh8hpeoe602uli1ljPT/asJDqdHkKuqAHLWJi
 b8soMOW8jd/0jUuhidw/TtkwTFVkvPU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-75-O_xeqy6VPbmRWEa74iyyuw-1; Fri, 02 May 2025 05:03:01 -0400
X-MC-Unique: O_xeqy6VPbmRWEa74iyyuw-1
X-Mimecast-MFC-AGG-ID: O_xeqy6VPbmRWEa74iyyuw_1746176580
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43d3b211d0eso11341895e9.1
 for <qemu-rust@nongnu.org>; Fri, 02 May 2025 02:03:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746176580; x=1746781380;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/IRAGOm/TB6BHj4C+HObeEmG8st+nADkj/KyPgOtSG4=;
 b=pHb6GxhrFb6C6b7FznYYR7NAwjpVLvFRjEu3SsySuQ+yC7m98K9zDgLfYS9N4Bkdxq
 nD1vPe9qfDyEMLTqyCxwRzo+FtmtcP2D+ob7VRVRkHJdcim1uS28GYEz3aKv4gWsTwTe
 otsOfUyH9XS9zqkzN0XlpUs2budUQITFEyk9lAdNDGBzlAWLvK4333yBRz84BNUrVIi8
 8BPARtcTkafC10nNcSVcvw97xIoyMgwDTgNjfGkEl3K8zW2W5SfACBogey3WtYVrXcCN
 BlG31R127vMSe21SfgytZRAon+UHAn6AQIqELxqfCuoN3kpIbGgt9zLgmsl6e7QmTDjO
 jaQQ==
X-Gm-Message-State: AOJu0YwVPFdSG2NS5XtgonuzxGnC9CVTfC+3F7LeZNVD+M35/E+cnzxF
 8i3y36bq89D2j4lBpB0wiysAFUCbjwXq//1HosMP1UUkS5azkmwhUFAVH4NVXBlFB17WdmLXCBi
 4Ulm9SNeDVd+UUsAZgwoyiI5hd2FuBioTutPQSP1HLer3yd665iM=
X-Gm-Gg: ASbGncs5z7YtJ6fgQl+lNwB8OKFCNK3DCH8Hr82D4mo5YGzHG6lsuMwGJ94A89V+kmo
 5JCn7AK8FtfbeLIn5ao24lC8f3M7impXhgOsKm9Al4S8JGVkk7T4T/pb1HmBKMhzsMJdpIaiDWi
 A5cK6b6By20mwSJqIbU3b4PEUtM+CtxOJYoYTQhxgyWBFdFBEIqWe7oCweqIaUcOgmC8QYIJZA9
 0exBczo3oOsQWVQ1R4hNNnGebQnPYhdL2divB/aX3sN4VPsU1fNaIqjzxh71TBDr6R0j1IUYLdI
 ALmmnZNeblO65D0=
X-Received: by 2002:a05:600c:1d89:b0:43c:ed33:a500 with SMTP id
 5b1f17b1804b1-441b72dc63amr46267665e9.10.1746176580016; 
 Fri, 02 May 2025 02:03:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKOMiDYb7dlvxr98QkvzOLMCpyckrL8k1NYz7eXCtL0ojlv4qfY9X1R/kOEQ4FY8xqe6oGNQ==
X-Received: by 2002:a05:600c:1d89:b0:43c:ed33:a500 with SMTP id
 5b1f17b1804b1-441b72dc63amr46266805e9.10.1746176579119; 
 Fri, 02 May 2025 02:02:59 -0700 (PDT)
Received: from [192.168.10.48] ([151.95.54.106])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b89cc7d9sm38773755e9.7.2025.05.02.02.02.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 02:02:58 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	zhao1.liu@intel.com
Subject: [PATCH 0/2] rust: vmstate: improvements to varray handling
Date: Fri,  2 May 2025 11:02:55 +0200
Message-ID: <20250502090257.85969-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: V1AnuOlRRsRFbV1RliFPySyYjfkXOyWgVAhiAmlYfRI_1746176580
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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
X-List-Received-Date: Fri, 02 May 2025 09:03:05 -0000

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


