
export const PRICING = {
    REGISTRATION_FEE: 350,
    EMBALMING_FEE: 50,
    COLD_ROOM_DAILY_RATE: {
        NORMAL: 13,
        VIP: 20
    }
} as const;

export function calculatedaysInStorage(admissionDate: string | Date, endDate: string | Date = new Date()): number {
    const start = new Date(admissionDate);
    const end = new Date(endDate);
    const diffTime = Math.abs(end.getTime() - start.getTime());
    const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
    return Math.max(0, diffDays); // Ensure no negative days
}

export function calculateProjectedBill(
    admissionDate: string | Date,
    type: 'Normal' | 'VIP' = 'Normal',
    existingFees: {
        registration?: number,
        embalming?: number
    } = {}
) {
    const days = calculatedaysInStorage(admissionDate);
    const dailyRate = type === 'VIP' ? PRICING.COLD_ROOM_DAILY_RATE.VIP : PRICING.COLD_ROOM_DAILY_RATE.NORMAL;

    const coldRoomFee = days * dailyRate;
    const registrationFee = existingFees.registration ?? PRICING.REGISTRATION_FEE;
    const embalmingFee = existingFees.embalming ?? PRICING.EMBALMING_FEE;

    return {
        days,
        dailyRate,
        coldRoomFee,
        registrationFee,
        embalmingFee,
        baseTotal: registrationFee + embalmingFee,
        total: coldRoomFee + registrationFee + embalmingFee
    };
}
