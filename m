Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 730A8F3C264
	for <qemu-rust@archiver.kernel.org>; Mon,  9 Mar 2026 14:06:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vzbFY-00066Y-OQ; Mon, 09 Mar 2026 10:06:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vzbFT-000664-Ov
 for qemu-rust@nongnu.org; Mon, 09 Mar 2026 10:06:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vzbFR-0000BF-IH
 for qemu-rust@nongnu.org; Mon, 09 Mar 2026 10:06:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773065175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=ML7u55NblCFGZlDajh7P+HcstiZkIn+Kfr3TwMsK1y3r37i4iwrtZdFMdo52vF07eTPQ00
 iHkGu1qggl4kOwkGU+GSNfb/r8jEgFg2zrfhCq3TaYalGB4DQ5Q7jw/x15BVu4yBTmBllY
 dwh+pWttXw4TN9gnk2furvQWQZ5RGUc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-421-cu5IN4_8NR6M214YF_ICIg-1; Mon, 09 Mar 2026 10:06:14 -0400
X-MC-Unique: cu5IN4_8NR6M214YF_ICIg-1
X-Mimecast-MFC-AGG-ID: cu5IN4_8NR6M214YF_ICIg_1773065173
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-439c54e0f6aso4264823f8f.0
 for <qemu-rust@nongnu.org>; Mon, 09 Mar 2026 07:06:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773065173; x=1773669973;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=eQLAZNf2ooWpW42D5rv0CPrlpPAYyc8wnS0BlnB5ayAH9KYxltzLS3LIoB+mHnkJzx
 ISLR2XLVgVcvG5O4BHLX9mYHGuU0YEccHiTCoB1pMr1HFQXYoDpwHQOEWTcYNilUjvT1
 iRfo+KZnz/ysR2hDD9gWj2IuSiCKxqN6f9SiKVeruDYmlEJh9pVrN+7lScxLDKHX1+UD
 bI+2xLCLJjyo2SEzkyQBeJf4ES+6x63wye7wa2UGka6gMLomJmiwNUgHCreFe2Izex0d
 1632iN8lF+ls1XEJibDEaI8P7Mw4L5GPM1oXSWz7fVTs7oiUI42Z0M2UgQeuv7AcKqlr
 Uitw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNKiYXplq72R5ZFCjDD+O6WMXYZOK4Cpe8EsXpRG3RXo8gxMEKz2ffcvq75pYgL4HbJTnRs6/KDGo=@nongnu.org
X-Gm-Message-State: AOJu0Yy1plhdGecl2coYLn6rYWqWAbnvOdphcJxrKcfqHiAAlNZYLRY2
 dyn64ydwiDXObNtqF2Wy3CibPHcUs/C1FEfiiT8jFBUpWnQk/G8mSlu6N62ElDTgetM7enbMwyU
 MwX2nfthJD/JA4dSSqJ6YWl6gad+/0IM5S4Nr9anmpsE9nlnmDKVnFYM=
X-Gm-Gg: ATEYQzycyHuHabfczK0cbAIW7TSYnKLN9RGGxomqKftcImq9K/YR9YxEE2yAuzJXinn
 75QoEpVCqF/6zBZVXw/3U51LcRXhV5lWbEOhYuB1QJtFuyKrdLDaWJTHFQP8xF6zcuQzqZ4F7ie
 YaU7vPT5W+RJKu13LtFAcZQWfGMWP45ZdDAzbFpR/IEt44zwDMSDxp0zqaUUShsKuHpfOnLL/sB
 fG9ll/5g8+K9z6xGyh3bvn0sGvSvh9DzTxCKuPkMre5YDBCiVT7M7p2VWO7n9adD+fFCzRvgTv5
 RqjGwGqmAEqZvPU8kK6HXdctROFh3xXZTQVnyPsQJaTE/3LC2Ddd3uPOybZLjEgBMaipg7yj1MV
 EonK5+Hpd/s40rUpcIi8YaXWAaIP/r5vlvF3Omku+nnubQIb5cFawk3hM7p7tHvw+ZJ+trzFSyU
 MEw7qPcPOi6x0BkNgelaRiz2m8bmA=
X-Received: by 2002:a05:6000:603:b0:437:7719:ca82 with SMTP id
 ffacd0b85a97d-439da32789bmr18916882f8f.3.1773065172830; 
 Mon, 09 Mar 2026 07:06:12 -0700 (PDT)
X-Received: by 2002:a05:6000:603:b0:437:7719:ca82 with SMTP id
 ffacd0b85a97d-439da32789bmr18916824f8f.3.1773065172295; 
 Mon, 09 Mar 2026 07:06:12 -0700 (PDT)
Received: from [192.168.10.48] ([151.95.144.138])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dad8daf2sm27473130f8f.2.2026.03.09.07.06.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2026 07:06:11 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 qemu-rust@nongnu.org
Subject: Re: [PATCH v2] hw/timer/hpet: Remove HPETState::hpet_offset_saved
 field
Date: Mon,  9 Mar 2026 15:06:10 +0100
Message-ID: <20260309140610.111240-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260306093134.27789-1-thuth@redhat.com>
References: 
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TL83NxbUEIzMkXhTRSJoy2TpyAJtSV0EFguUrUlrbc8_1773065173
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.819, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.903,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 TVD_SPACE_RATIO=0.001 autolearn=no autolearn_force=no
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

Queued, thanks.

Paolo


