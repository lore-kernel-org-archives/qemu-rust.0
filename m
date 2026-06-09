Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B35CD8CB2
	for <qemu-rust@archiver.kernel.org>; Tue,  9 Jun 2026 17:26:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1wX0D1-0007dn-I9; Tue, 09 Jun 2026 13:25:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wX0Ch-0007O8-HS
 for qemu-rust@nongnu.org; Tue, 09 Jun 2026 13:25:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wX0Cd-0001qf-DG
 for qemu-rust@nongnu.org; Tue, 09 Jun 2026 13:25:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781025925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TAvDvHwNOpZMXGaEBVC9aqY/2Ki2d+eUzFoO5QqTfx8=;
 b=PDjoUd4hBWdLqDVpJJOBVH1DbwpV/TBCPwcao/HR5vxcdxuuT4icSx7lLCp9Pzq5D7qVAB
 fsUe3K4c12Qe7KzByqCGSD/UDQ4nSytTJDb1pIpBetVUOGk4tsWnjJyCvKwcTK8zMmHRRq
 kiT7wnHYX4joiBJQJLGLmtOpqFMJMDw=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-166-xTBztgM_Ormm_qg6NFeqLQ-1; Tue, 09 Jun 2026 13:25:24 -0400
X-MC-Unique: xTBztgM_Ormm_qg6NFeqLQ-1
X-Mimecast-MFC-AGG-ID: xTBztgM_Ormm_qg6NFeqLQ_1781025924
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51775f7b2afso124254401cf.1
 for <qemu-rust@nongnu.org>; Tue, 09 Jun 2026 10:25:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781025924; x=1781630724;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TAvDvHwNOpZMXGaEBVC9aqY/2Ki2d+eUzFoO5QqTfx8=;
 b=TB5R3/PRrccc/RtFyU3SLEMShjXwNiuf2zikAobDar6RFFoVrZDz+DtKZhor7ywiBe
 Kjk0t7yxhKphSrhIP9C0LUPULJKadGMUXxBppgcIhBhgfjZ12uw4YPFchB+U9bKsSOk+
 qNzPnOZCOOA4/F11tvwOrA+1iVZ5Z39gFu5txCCUyKUJzClgPOxP4wVywrUu0PUlaqBq
 VE46YPC2DCfe2npj1pff92hSabANUVOpFePgRmf5Cw2R8IOukRKNvm4xWfd3klcAhVQw
 QgzMW0IEIS/aOcgbdzk2NBmEXQsot8qi1R1ptfacTJLzLRfFpeaGDTG+V9vyHpW4N/IL
 KTdA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9ubvEcgQotlTQwq6mTg1PFuawt39Zpbk6DnvoLHM6hUaEjZqXGvsJhLZ0pusqpJ3YeDNIy6NwD01k=@nongnu.org
X-Gm-Message-State: AOJu0YwF5rpGENtzeHrizS2cccg8u4OCLqCGYPRYkbRxETfDeeqt7s0Y
 RZ9kEUtgk/x73N/Ecl+O4bagdurdG2UX0brEVwz/AIpMYaTGMB4CpaQ4VIDmgWLgZBVNuJwORcG
 QoEjF/jwTSEh1GyFKld2OM76OLvUC2fSB0BQCO1pBzXp72Ebdy0vD+AQ=
X-Gm-Gg: Acq92OHlYQ7x11q4v5huZMIfpPv1AKa6uho2dNv3x0mcZ61VqGdprZMc1kMbmiL0p67
 CMQHPkeJHv//Tqj4E4Fh5y2JJtA5xqFc/D6/hDWBRwbG6k0GG5nsIVIv5QYL4VkD5tGSbyitNGq
 PeJVJnkqkz6dQ3ExSQLl6sagLFIuy7l14m9/kvFeBo3RLl5o4wDLRgcdh42C0Gw3PQBJDLC4IzR
 YQ9Mae5yqpj5tTDhtTlxWRnIPh3PbMRwEqKBTl25AzLFYi81MhVTVdJN2esvL0z8GhwUF9/ljyG
 Sq8B47fPc3s6n9mp+nPPXTflxg6t4zhtsWeQEedCXUxGgRL/XNKkUI8gFCFnb8LaZELXQv2BRmc
 dTrjRBYILhhCt3NEzloO2/lg=
X-Received: by 2002:a05:622a:a593:b0:517:7871:693f with SMTP id
 d75a77b69052e-51798672991mr221134761cf.8.1781025923897; 
 Tue, 09 Jun 2026 10:25:23 -0700 (PDT)
X-Received: by 2002:a05:622a:a593:b0:517:7871:693f with SMTP id
 d75a77b69052e-51798672991mr221134161cf.8.1781025923234; 
 Tue, 09 Jun 2026 10:25:23 -0700 (PDT)
Received: from x1.com ([142.189.10.167]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51775da2c56sm187524711cf.21.2026.06.09.10.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 10:25:22 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Fabiano Rosas <farosas@suse.de>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr . David Alan Gilbert" <dave@treblig.org>,
 Eric Blake <eblake@redhat.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Sana Sharma <sansshar@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Juraj Marcin <jmarcin@redhat.com>, qemu-rust@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>
Subject: [PATCH v2 03/10] qdev: Introduce DEFINE_PROP_*_NODEFAULT for
 bool/uint32
Date: Tue,  9 Jun 2026 13:25:07 -0400
Message-ID: <20260609172514.2037645-4-peterx@redhat.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260609172514.2037645-1-peterx@redhat.com>
References: <20260609172514.2037645-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8GkxCgojpNJq-hHWOu821o2ra5lH-6kc_XGt5_jOoqs_1781025924
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Introduce two macros that will be used in follow up patch to create qdev
bool or uint32 properties without a default value.  Do not introduce the
rest until they can be used.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/hw/core/qdev-properties.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/hw/core/qdev-properties.h b/include/hw/core/qdev-properties.h
index 248bbcbba7..43878d1f9e 100644
--- a/include/hw/core/qdev-properties.h
+++ b/include/hw/core/qdev-properties.h
@@ -124,6 +124,9 @@ extern const PropertyInfo qdev_prop_link;
                 .set_default = true,                         \
                 .defval.u    = (bool)_defval)
 
+#define DEFINE_PROP_BOOL_NODEFAULT(_name, _state, _field)     \
+    DEFINE_PROP(_name, _state, _field, qdev_prop_bool, bool)
+
 /**
  * The DEFINE_PROP_UINT64_CHECKMASK macro checks a user-supplied value
  * against corresponding bitmask, rejects the value if it violates.
@@ -201,6 +204,8 @@ extern const PropertyInfo qdev_prop_link;
     DEFINE_PROP_UNSIGNED(_n, _s, _f, _d, qdev_prop_uint16, uint16_t)
 #define DEFINE_PROP_UINT32(_n, _s, _f, _d)                      \
     DEFINE_PROP_UNSIGNED(_n, _s, _f, _d, qdev_prop_uint32, uint32_t)
+#define DEFINE_PROP_UINT32_NODEFAULT(_n, _s, _f)                        \
+    DEFINE_PROP_UNSIGNED_NODEFAULT(_n, _s, _f, qdev_prop_uint32, uint32_t)
 #define DEFINE_PROP_INT32(_n, _s, _f, _d)                      \
     DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_int32, int32_t)
 #define DEFINE_PROP_UINT64(_n, _s, _f, _d)                      \
-- 
2.53.0


