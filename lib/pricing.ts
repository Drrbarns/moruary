
export const PRICING = {
    REGISTRATION_FEE: 350,
    EMBALMING_FEE: 0,
    COLD_ROOM_DAILY_RATE: {
        NORMAL: 13,
        VIP: 20
    }
} as const;

export function getColdRoomRate(type: 'Normal' | 'VIP' = 'Normal', branchName: string = '', branchCode: string = '') {
    // Check for Asanteman Branch specifics
    const identifier = (branchName + '|' + branchCode).toUpperCase();
    if (identifier.includes('ASANTEMAN')) {
        return type === 'VIP' ? 30 : 15;
    }
    // Default (Asuom, etc.)
    return type === 'VIP' ? PRICING.COLD_ROOM_DAILY_RATE.VIP : PRICING.COLD_ROOM_DAILY_RATE.NORMAL;
}

export function getRegistrationFee(branchName: string = '', branchCode: string = '') {
    const identifier = (branchName + '|' + branchCode).toUpperCase();
    if (identifier.includes('ASANTEMAN')) {
        return 430;
    }
    return PRICING.REGISTRATION_FEE;
}


export function calculatedaysInStorage(admissionDate: string | Date, endDate: string | Date = new Date()): number {
    const start = new Date(admissionDate);
    const end = new Date(endDate);
    const diffTime = Math.abs(end.getTime() - start.getTime());
    const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
    return Math.max(0, diffDays) + 1; // Ensure no negative days and add 1 day buffer
}

export function calculateProjectedBill(
    admissionDate: string | Date,
    type: 'Normal' | 'VIP' = 'Normal',
    existingFees: {
        registration?: number,
        embalming?: number
    } = {},
    branchContext?: { name?: string, code?: string }
) {
    const days = calculatedaysInStorage(admissionDate);
    const dailyRate = getColdRoomRate(type, branchContext?.name, branchContext?.code);

    const coldRoomFee = days * dailyRate;
    const registrationFee = existingFees.registration ?? getRegistrationFee(branchContext?.name, branchContext?.code);
    const embalmingFee = 0; // Forced to 0

    return {
        days,
        dailyRate,
        coldRoomFee,
        registrationFee,
        embalmingFee,
        baseTotal: registrationFee + embalmingFee,
        // Registration fee is taken at registration and excluded from discharge total
        total: coldRoomFee + embalmingFee, 
        outstandingTotal: coldRoomFee + embalmingFee
    };
}
