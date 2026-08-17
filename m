Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A606C5B572
	for <qemu-rust@archiver.kernel.org>; Mon, 17 Aug 2026 13:46:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1wvxf6-0003RS-H2; Mon, 17 Aug 2026 09:46:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wvxf4-0003Qj-Lb
 for qemu-rust@nongnu.org; Mon, 17 Aug 2026 09:45:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wvxf3-000206-4n
 for qemu-rust@nongnu.org; Mon, 17 Aug 2026 09:45:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1786974356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eZJZ1vTfQ4X4n6DhMPbSXuibBX09Z/gvdSMaXWwEFG0=;
 b=dL10Wh1MeRhT21TNrFMjvYHygviadO+7X/W2gX/I9xn+JgEMl3j8jjYVThLSpCzdEisDWF
 MZe3iUOdFDm/uemgNaQCYF2mB+KDh80iK/Uy56mEJ6OmY++f2pft1aQP0YO45xr/92fVhv
 iyhCyZdYEiT6iMwIC14EIxl1Qnliq+w=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-VQF5Y_kENGWI5_yq68Ngsg-1; Mon, 17 Aug 2026 09:45:54 -0400
X-MC-Unique: VQF5Y_kENGWI5_yq68Ngsg-1
X-Mimecast-MFC-AGG-ID: VQF5Y_kENGWI5_yq68Ngsg_1786974354
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-49955a9dbcdso22374475e9.1
 for <qemu-rust@nongnu.org>; Mon, 17 Aug 2026 06:45:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786974353; x=1787579153;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=eZJZ1vTfQ4X4n6DhMPbSXuibBX09Z/gvdSMaXWwEFG0=;
 b=Zu7VZKnr5AFfC0352i2N1xiP2eAlB/awxvce0Ypnw/ocYk0z7MOLScmrunJqBa3adg
 7JmR11OwcyvlsUKSjwOxJ1plwtUTFtly3NtQomdn7+rk4hFOGwTiPk4OvRezEEqd/q/1
 haDbCW6etZBQk3URXCxl0llyl3zsHrNstAaQy7qSUP+Z3LvJJMHn+Xh4Ih78RnHij8cN
 KMEEfs93kRR13f/HEWQiCxit+dFIu3tCzb8f9Gu8KDOZRL7lhuQXn4F03oQU0TW87EkH
 nMlsoU8kltJmb3PJ56ur98/saC68OuQnJ5ts9cWPZhBBPPiw5gyfUlEkcuGrajA4Dq0k
 pDdQ==
X-Gm-Message-State: AOJu0YwrFFW5PSdvbC287bMIOFxhfIOjNuI5UjGxRoS+J9B4MOdLLaty
 ximNb83dhUJxIxmrp8qxeMORtdT4SJY2W0lq+bqBBTflQDudgZRAUEzqaNJHey7I6HRlotfMkBt
 aLYqVc1Gca1Ubknnhdn9uPJw46Gg1dWNP5c/ImInGs5WChO95R0VEDuM=
X-Gm-Gg: AR+sD13DbnqI1WwS57cpM6GD3sjFNTlXXIechsz9e3c168t4LpZc2CGtYPezbTChY0S
 2Sak+n+4yWel6M2V767cOdBFn5TH4cf+L5LPOm2CrCvVjdvht7K9XrpO4ybFtfEIvwJbkITvCzx
 gbBvc3L2DMqA4g/KpPdgo7+2PN1FKxZzJ/nuyBQIYXp0ZfDpyavKhi8jyKFL7Yo+J3T7GOljWAI
 PXAIdtdp9Fw21EEWAhHo+oFvaN4vgCiCuL7zFZzUK+UhqKDhLMBGNTRTeYOE/jS6QwkFMKmr3t5
 RxbKNlIjWeqAqHypMd1BEdW6/PuBNNG4kqhetGtGs0V5qjEzQ2GkKTQwdh0DopqYLgSXuzsRao2
 EnH8qJ9xNr6rJg24YC/IWGaZuRSzMnjnNCuDlMX+X76BTtQUuUEfadazzgZV5iqBN
X-Received: by 2002:a05:600c:4fca:b0:493:a623:d090 with SMTP id
 5b1f17b1804b1-49987961c23mr381396385e9.10.1786974353212; 
 Mon, 17 Aug 2026 06:45:53 -0700 (PDT)
X-Received: by 2002:a05:600c:4fca:b0:493:a623:d090 with SMTP id
 5b1f17b1804b1-49987961c23mr381395355e9.10.1786974352704; 
 Mon, 17 Aug 2026 06:45:52 -0700 (PDT)
Received: from [192.168.10.48] ([151.95.34.92])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4999d11f073sm49117855e9.15.2026.08.17.06.45.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2026 06:45:51 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 5/9] meson: use compiler_target() to get rustc target
Date: Mon, 17 Aug 2026 15:45:33 +0200
Message-ID: <20260817134538.924615-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260817134538.924615-1-pbonzini@redhat.com>
References: <20260817134538.924615-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: w9mJZhtDWNnAyWzvP11M0JKlS31uBizFK9_UAABSANo_1786974354
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.343,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

The new method in Meson 1.11.x removes the need to pass the triple
via config-host.mak.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure   | 3 ---
 meson.build | 2 +-
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/configure b/configure
index 7f637c018c3..56158cd95f7 100755
--- a/configure
+++ b/configure
@@ -1740,9 +1740,6 @@ if test "$container_command" != ""; then
     echo "CONTAINER_COMMAND=$container_command" >> $config_host_mak
 fi
 echo "SUBDIRS=$subdirs" >> $config_host_mak
-if test "$rust" != disabled; then
-  echo "RUST_TARGET_TRIPLE=$rust_target_triple" >> $config_host_mak
-fi
 echo "PYTHON=$python" >> $config_host_mak
 echo "MKVENV_ENSUREGROUP=$mkvenv ensuregroup $mkvenv_online_flag" >> $config_host_mak
 echo "GENISOIMAGE=$genisoimage" >> $config_host_mak
diff --git a/meson.build b/meson.build
index 2139dfc7ce8..2593eb97624 100644
--- a/meson.build
+++ b/meson.build
@@ -4747,7 +4747,7 @@ else
 endif
 summary_info += {'Rust support':      have_rust}
 if have_rust
-  summary_info += {'Rust target':     config_host['RUST_TARGET_TRIPLE']}
+  summary_info += {'Rust target':     rust.compiler_target(native: false)}
   summary_info += {'rustc':           ' '.join(rustc.cmd_array())}
   summary_info += {'rustc version':   rustc.version()}
   summary_info += {'rustdoc':         rustdoc}
-- 
2.55.0


