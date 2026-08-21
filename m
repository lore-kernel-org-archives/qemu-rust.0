Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D31FCC5DF7D
	for <qemu-rust@archiver.kernel.org>; Fri, 21 Aug 2026 08:40:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1wxKn4-0005F5-AU; Fri, 21 Aug 2026 04:39:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wxKn2-0005En-Q2
 for qemu-rust@nongnu.org; Fri, 21 Aug 2026 04:39:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wxKn1-0008MJ-Db
 for qemu-rust@nongnu.org; Fri, 21 Aug 2026 04:39:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1787301590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MWxQH9gL9sLdexucta7qH+Siu5S42ahcdZRs44zuXqY=;
 b=NKmgcKfv4jlNemYZTRhLKDkIJx1PSiEdgSsyzUP6xbpfg5J2j5ZWA9s1fb0bVeFrtjC4K5
 IkUGldhlndFcgGkJZUyyOq6zxFEOtx4v2dh2nAXMliruHIyv8yVapySVM9e2tteZ+8yPYa
 +JL/YZY6BzP2sUTPkdInMD90K1rv5r4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-vw3P15hdOCy1e6gjBOhMEg-1; Fri, 21 Aug 2026 04:39:48 -0400
X-MC-Unique: vw3P15hdOCy1e6gjBOhMEg-1
X-Mimecast-MFC-AGG-ID: vw3P15hdOCy1e6gjBOhMEg_1787301588
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-c1c232fa136so72203466b.0
 for <qemu-rust@nongnu.org>; Fri, 21 Aug 2026 01:39:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787301588; x=1787906388;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=MWxQH9gL9sLdexucta7qH+Siu5S42ahcdZRs44zuXqY=;
 b=o4LRm+XtYPxhYPL/3EtSDWUMSFXuGHLw6wgtROnEw/kG82YdeGsQLTvsHGmY20pXFf
 a7NGMapeDOOc/fGrlqlejBBsbxsf7nBdg1+Q0LTuuBCzJCmLvbxWswkNIIfxQ7CHmqJj
 9yuh85OX884GRqc9N5+bZ9gL2qEsfP0EVXv7DY5oLezevrCtkNTyO9YMkhNZRw5jAVkk
 zEo3pyxk6CAGb6HUKrB89LG27yWdDCyn0PkdF3iUe9rWHTYN3+/IzHhvmSnbg+WqMJ84
 4pDnm7o8BBMtTOgfDqre6aRw84DHBrqKic7WaXUZ41B1HIz+O29QxXSu9ck5fIQxHlMc
 DIhg==
X-Gm-Message-State: AFuF++kLcTmwlpwqf777eU9/XSqvEhRQSrgbhFkwioPCwrBr8EVIBfFr
 /fPjXeyrO87y4Gg/zmnBfzYdTA9p8CB5Xs3Q3kxuvM55tq/ZU9kTtbcOvwkorZvJeKWxTFWAO2S
 8ku6trnjp1G/0wOLu5hQ47CIbe87sf/Scla3cRI9IRgFJRufhYoKUWo8=
X-Gm-Gg: AR+sD12/ajDZnS6TDXGcvBME3Vn29ydajQkgaHKR08aIEIPCyLTqoHwtQc0VuA8fpur
 QJ89Ma0HzV9uEfTLt1rKr32DK5tJJBoXQ8KOk3SKrjeHhBqKy0U+xcvfJM7osN2utstQS4TroiK
 tw4f9R1M0VuRXw6znvdGmgN8vuP0Iq0bI9ZdYQ7xU9ArulBDgPRRzumhR+/df1WUHuAw7ILDoGc
 z9qo2hTThXKdLC3d2aVs+nxdZHB2H4H6Wk/7hg7njb9zX0Gfwaul/JfdNvuMhStcJb0WN/8u20o
 3dZU5EisP1PJv1IojM2wDb6J5h/X4WoLSBMj93eczFMWkf3Qc9FdoeSyN8sDxfEs4LLCitT0Lad
 1umX4aPvOdVUN52+UZlSEkq7saCpgVO7XkaVr0+td6KY9vXowB2TMMIS97AXoO+OMc2QVXZD7L1
 M0HY8=
X-Received: by 2002:a17:907:9345:b0:c24:6382:2648 with SMTP id
 a640c23a62f3a-c246d633d8amr363681066b.5.1787301587813; 
 Fri, 21 Aug 2026 01:39:47 -0700 (PDT)
X-Received: by 2002:a17:907:9345:b0:c24:6382:2648 with SMTP id
 a640c23a62f3a-c246d633d8amr363676766b.5.1787301587385; 
 Fri, 21 Aug 2026 01:39:47 -0700 (PDT)
Received: from [192.168.10.48] ([151.95.34.92])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2458b05dcfsm320054266b.14.2026.08.21.01.39.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2026 01:39:44 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 8/9] scripts: rename get-wraps-from-cargo-registry.py
Date: Fri, 21 Aug 2026 10:39:23 +0200
Message-ID: <20260821083925.2008135-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260821083925.2008135-1-pbonzini@redhat.com>
References: <20260821083925.2008135-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: i5sBchaN5c3MGG5bv176S_r63rfvC6DhLQM3qYBxzGs_1787301588
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.346,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

It does more than that now.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 .../{get-wraps-from-cargo-registry.py => update-cargo-wraps.py}   | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename scripts/{get-wraps-from-cargo-registry.py => update-cargo-wraps.py} (100%)

diff --git a/scripts/get-wraps-from-cargo-registry.py b/scripts/update-cargo-wraps.py
similarity index 100%
rename from scripts/get-wraps-from-cargo-registry.py
rename to scripts/update-cargo-wraps.py
-- 
2.55.0


