Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D73ECCAC5A7
	for <qemu-rust@archiver.kernel.org>; Tue, 23 Sep 2025 07:52:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v0xoa-0001bD-0W; Tue, 23 Sep 2025 03:51:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v0xoV-0001ag-U6
 for qemu-rust@nongnu.org; Tue, 23 Sep 2025 03:51:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v0xoP-00058G-58
 for qemu-rust@nongnu.org; Tue, 23 Sep 2025 03:51:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758613901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=X2gDWrWbkkLCuXVBWE/6Sqmloy9JuTRCBt5O8r85ruqbQQheVJ1L48oqD5+A1o3eUutthI
 86vxwmrAS//5moiL8gsnWrR71+0O0mldCf9Jl6a3t+nWpTaw3ZB0TyOd9nVtVoyc22jqRm
 wvPRKaGIhSmMfEVHHMzr+G/WOSU84So=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-310-0w0AX3uaMkCZtMxf00Vrhw-1; Tue, 23 Sep 2025 03:51:39 -0400
X-MC-Unique: 0w0AX3uaMkCZtMxf00Vrhw-1
X-Mimecast-MFC-AGG-ID: 0w0AX3uaMkCZtMxf00Vrhw_1758613898
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-b2d1072a9c4so135520366b.3
 for <qemu-rust@nongnu.org>; Tue, 23 Sep 2025 00:51:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758613898; x=1759218698;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=JSqB416nTG/NepJ+WRITqqL9AlAv3GhYtpWPymag9M5ZwJManBzzXboObXWeADkYxA
 yeUM7gXFSIRARCz/PkDUaslGvMELGns8i3+S70nq/cLRbLvOXkUzlky4bQUmIRTduNLe
 939PiZiauBxoCj3IKCabEwbrLmtNOuiSwnMBtNTPtcgwebZljckBY2PmJqZJmIyttQPi
 oKnqB0OlPi9q8/L4ahNzK22y6DJ8ECsH8EIjydjsUS/uCtPCBwfEd/wXQCN8mOjDvtgY
 nDxjs6hEQD4XFZLTZb4293TSPK8Za3j68B1CoXfO6iBtfVDnm7kr3/zvIpdZKVm0SqB+
 h6gQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/1jFSQacWHQU94thyC72AVc5YtrOaxjVdK7uH5glT/Ztqex+kaX8JbMyJ4YAfeq9Sdqu8t70t42o=@nongnu.org
X-Gm-Message-State: AOJu0YzhsG8p0Saoo4lFzvYC8ExY8gWODlwvbMbNV4Y6OV3tffSxl3Xr
 rZsc0W+GlE7p+WS2AnN/YMmKJgWQ6Np/Rz0RdyFDDfYIQlbCQOLJu+d/YJ/ZvS7iFunGpDX5duJ
 x/WcSne5Vx+nrhd1570Bw3EdHvtj3udFmQPbQCJRrX0u8f+Wk2nojEYA=
X-Gm-Gg: ASbGnct1XfBqJ2E2EFlPPAxPWgi8iVsLrMOO70iUfLnLo774sVKje3TXn4JBgY28bMR
 B48JnhWsVpp7azZNUrgBPe3dBOsly2nnC291Jui0qlO1Qist601M3Z48QK9KIXdYtA6Px7aSsHw
 Kp3htQsdIB3JAeaSsyZbMLykAQ+Hyizco3IyFED6oF7P+WgkXSJmIS4LgWKslyDZGsLPdILDyPi
 vKIVHptmCPuH2PpXXAEIMXJRBAgLcYbFA9hOdD5xhgnX3kTZEGgT01g4G3bq7mMhovoIIJs4aDR
 ma1MMjLPjh8mXQF2N5VHsH2StYq4OPfSC0I46etqawSR34jAm+gGc6ck1lhFt0IEUYtmvU1Qs6o
 L6vILSRUOJB+r6yqsz+65R47Vz6YHCmLHJ3Vo31D2xk5+Sw==
X-Received: by 2002:a17:907:d91:b0:b2e:13a:8d75 with SMTP id
 a640c23a62f3a-b302ab33ab4mr135598866b.32.1758613898282; 
 Tue, 23 Sep 2025 00:51:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2PeKe2akn0K57bYEKnScjXMFiKE7N/XpVy5p726qyaC4MRFbv2NlHDs52lzZIvOOiT94VdA==
X-Received: by 2002:a17:907:d91:b0:b2e:13a:8d75 with SMTP id
 a640c23a62f3a-b302ab33ab4mr135596466b.32.1758613897828; 
 Tue, 23 Sep 2025 00:51:37 -0700 (PDT)
Received: from [192.168.10.48] ([176.206.127.188])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b290caba5a6sm692046966b.65.2025.09.23.00.51.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Sep 2025 00:51:37 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 qemu-devel@nongnu.org, qemu-rust@nongnu.org
Subject: Re: [PATCH v2 00/12] rust: miscellaneous cleanup & HPET #property
 conversion
Date: Tue, 23 Sep 2025 09:51:32 +0200
Message-ID: <20250923075132.90995-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250920160520.3699591-1-zhao1.liu@intel.com>
References: 
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ge6NlF_NVSvBr3aT9qoGNHy7ATHYAkwk5jl4nIx1cT8_1758613898
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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


